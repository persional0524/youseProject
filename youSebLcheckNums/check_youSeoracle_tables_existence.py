# -*- coding = utf-8 -*-
# @File    :   :check_youSeoracle_tables_existence.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/25 17:49    Lita       1.0         None

import cx_Oracle
import json
import csv

# 替换为你的Oracle数据库连接信息
username = 'ysky_sms'
password = '11111111'
dsn = '10.63.8.31:1521/ysky'

# JSON配置文件名
json_file = 'oracle_tables_config.json'
output_file = 'table_existence_report.csv'

# 建立与Oracle数据库的连接
try:
    connection = cx_Oracle.connect(username, password, dsn)
    cursor = connection.cursor()
    print("成功连接到Oracle数据库")

    # 打开JSON配置文件并解析表清单
    with open(json_file, 'r', encoding='utf-8') as f:
        tables_data = json.load(f)

    # 初始化统计信息
    total_tables = 0
    not_found_count = 0

    # 打开CSV文件，用于写入结果
    with open(output_file, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(['Module', 'Table Name', 'Exists', 'Row Count'])

        # 遍历每个模块
        for module, tables in tables_data.items():
            print(f"检查模块: {module}")
            module_total = len(tables)
            module_not_found = 0

            # 遍历模块中的每张表
            for table in tables:
                try:
                    # 查询表或视图是否存在
                    cursor.execute(f"SELECT object_type FROM user_objects WHERE object_name = '{table.upper()}'")
                    result = cursor.fetchone()
                    if result:
                        object_type = result[0]
                        if object_type == 'TABLE':
                            # 表存在，再查询数据量
                            cursor.execute(f"SELECT COUNT(*) FROM {table}")
                            row_count = cursor.fetchone()[0]
                            print(f"表 {table} 存在，数据量: {row_count}")
                            writer.writerow([module, table, 'Table', row_count])
                        elif object_type == 'VIEW':
                            print(f"视图 {table} 存在")
                            writer.writerow([module, table, 'View', ''])
                        else:
                            print(f"对象 {table} 存在，类型为 {object_type}")
                            writer.writerow([module, table, object_type, ''])
                    else:
                        print(f"对象 {table} 不存在")
                        writer.writerow([module, table, 'Not Found', ''])
                        module_not_found += 1
                except cx_Oracle.DatabaseError as e:
                    print(f"查询对象 {table} 出错: {e}")
                    writer.writerow([module, table, 'Error', ''])
                    module_not_found += 1

            # 更新总计数
            total_tables += module_total
            not_found_count += module_not_found

            # 打印模块统计信息
            print(f"模块 {module} 中找到 {module_total - module_not_found}/{module_total} 个对象")
            print("-" * 50)

        # 打印总体统计信息
        print("总体统计信息:")
        print(f"总共检查 {total_tables} 个对象，其中 {not_found_count} 个对象不存在")

    print(f"结果已保存到文件: {output_file}")

except cx_Oracle.DatabaseError as e:
    print("Oracle数据库连接或查询出错:", e)
finally:
    # 关闭数据库连接
    if 'connection' in locals():
        cursor.close()
        connection.close()
        print("Oracle数据库连接已关闭")
