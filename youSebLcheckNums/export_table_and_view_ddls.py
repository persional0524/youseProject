# -*- coding = utf-8 -*-
# @File    :   :export_table_and_view_ddls.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/26 17:18    Lita       1.0         None
import os
import json
import cx_Oracle
import logging
from datetime import datetime


def setup_logging():
    logging.basicConfig(filename='export_ddl.log', level=logging.INFO,
                        format='%(asctime)s - %(levelname)s - %(message)s')
    console = logging.StreamHandler()
    console.setLevel(logging.INFO)
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    console.setFormatter(formatter)
    logging.getLogger('').addHandler(console)


def get_table_ddl(connection, schema, table_name):
    try:
        cursor = connection.cursor()
        cursor.execute("""
            SELECT DBMS_METADATA.GET_DDL('TABLE', :table_name, :schema)
            FROM DUAL
        """, table_name=table_name, schema=schema)
        ddl = cursor.fetchone()[0].read()
        return ddl
    except Exception as e:
        logging.error(f"Error fetching DDL for table {table_name}: {e}")
        return None


def oracle_to_postgres_ddl(oracle_ddl):
    # Simple transformation example; adjust as per actual differences between Oracle and PostgreSQL
    postgres_ddl = oracle_ddl.replace("NUMBER", "NUMERIC")  # Example transformation
    return postgres_ddl


def create_directory_structure(base_dir, config):
    for module, tables in config.items():
        module_dir = os.path.join(base_dir, module)
        os.makedirs(module_dir, exist_ok=True)


def export_ddls_to_files(connection, schema, config, base_dir):
    success_count = 0
    failure_count = 0
    success_tables = []
    failure_tables = []

    for module, tables in config.items():
        module_dir = os.path.join(base_dir, module)
        for table in tables:
            oracle_ddl = get_table_ddl(connection, schema, table)
            if oracle_ddl:
                # Save Oracle DDL to file
                oracle_file_path = os.path.join(module_dir, f"{table}_oracle.sql")
                try:
                    with open(oracle_file_path, "w", encoding="utf-8") as f:
                        f.write(oracle_ddl + ";\n")
                    logging.info(f"Successfully exported Oracle DDL for table {table} to {oracle_file_path}")
                    success_count += 1
                    success_tables.append(table)
                except Exception as e:
                    logging.error(f"Failed to write Oracle DDL for table {table} to file: {e}")
                    failure_count += 1
                    failure_tables.append(table)

                # Convert Oracle DDL to PostgreSQL DDL
                postgres_ddl = oracle_to_postgres_ddl(oracle_ddl)

                if postgres_ddl:
                    postgres_file_path = os.path.join(module_dir, f"{table}_postgres.sql")
                    try:
                        with open(postgres_file_path, "w", encoding="utf-8") as f:
                            f.write(postgres_ddl + ";\n")
                        logging.info(f"Successfully exported PostgreSQL DDL for table {table} to {postgres_file_path}")
                        success_count += 1
                        success_tables.append(f"{table}_postgres")
                    except Exception as e:
                        logging.error(f"Failed to write PostgreSQL DDL for table {table} to file: {e}")
                        failure_count += 1
                        failure_tables.append(f"{table}_postgres")
                else:
                    logging.warning(f"Failed to convert Oracle DDL for table {table} to PostgreSQL DDL")
                    failure_count += 1
                    failure_tables.append(f"{table}_postgres")
            else:
                logging.warning(f"Failed to export DDL for table {table}")
                failure_count += 1
                failure_tables.append(table)

    logging.info(f"DDL export summary: Successful exports: {success_count}, Failures: {failure_count}")

    # Write success tables to file
    with open("successful_tables.txt", "w", encoding="utf-8") as success_file:
        success_file.write("\n".join(success_tables))

    # Write failure tables to file
    with open("failed_tables.txt", "w", encoding="utf-8") as failure_file:
        failure_file.write("\n".join(failure_tables))


def main():
    setup_logging()

    start_time = datetime.now()
    logging.info("Starting DDL export process")

    username = 'ysky_sms'
    password = '11111111'
    dsn = '10.63.8.31:1521/ysky'
    json_config_path = 'oracle_tables_config.json'
    output_base_dir = './output'

    # Connect to Oracle database
    try:
        connection = cx_Oracle.connect(user=username, password=password, dsn=dsn)
        schema = username.upper()  # Assuming schema name is the same as the username

        # Load JSON configuration
        with open(json_config_path, "r", encoding="utf-8") as f:
            config = json.load(f)

        # Create directory structure
        create_directory_structure(output_base_dir, config)

        # Export DDLs to files
        export_ddls_to_files(connection, schema, config, output_base_dir)

        connection.close()
        logging.info("Finished exporting DDLs.")
    except Exception as e:
        logging.error(f"Failed to connect to the database or export DDLs: {e}")

    end_time = datetime.now()
    duration = end_time - start_time
    logging.info(f"Total execution time: {duration}")


if __name__ == "__main__":
    main()
