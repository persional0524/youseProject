# -*- coding = utf-8 -*-
# @File    :   :check_youSeoracle_tables_existence.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/25 17:49    Lita       1.0         None
# 2024/7/05 09:15    Lita       2.0         None

import cx_Oracle
import json
import pandas as pd
import logging
import sys
from datetime import datetime

# 配置日志
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# 数据库连接信息
username = 'ysky_sms'
password = '11111111'
dsn = '10.63.8.31:1521/ysky'

# JSON配置文件和输出文件
json_file = 'oracle_tables_config.json'
timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
output_file = f'table_existence_report_{timestamp}.xlsx'


def get_chinese_name(cursor, table_name):
    """
    从 ALL_TAB_COMMENTS 视图中查询给定表的中文名称
    """
    try:
        cursor.execute(
            f"SELECT COMMENTS FROM ALL_TAB_COMMENTS WHERE TABLE_NAME = '{table_name.upper()}' AND OWNER = '{username.upper()}'")
        result = cursor.fetchone()
        return result[0] if result else ''
    except cx_Oracle.DatabaseError as e:
        logging.error(f"查询中文表名时出错: {e}")
        return 'Error'


# 建立与Oracle数据库的连接
try:
    connection = cx_Oracle.connect(username, password, dsn)
    cursor = connection.cursor()
    logging.info("成功连接到Oracle数据库")

    # 打开JSON配置文件并解析表清单
    with open(json_file, 'r', encoding='utf-8') as f:
        tables_data = json.load(f)

    # 初始化统计信息
    total_tables = 0
    not_found_count = 0

    # 创建DataFrame用于写入结果
    df = pd.DataFrame(columns=['Module', 'Table Name', 'Chinese Name', 'Exists', 'Row Count'])

    # 遍历每个模块
    for module, tables in tables_data.items():
        logging.info(f"检查模块: {module}")
        module_total = len(tables)
        module_not_found = 0

        # 遍历模块中的每张表
        for table_name in tables:
            chinese_name = get_chinese_name(cursor, table_name)

            try:
                # 查询表或视图是否存在
                cursor.execute(f"SELECT object_type FROM user_objects WHERE object_name = '{table_name.upper()}'")
                result = cursor.fetchone()
                if result:
                    object_type = result[0]
                    if object_type == 'TABLE':
                        # 表存在，再查询数据量
                        cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
                        row_count = cursor.fetchone()[0]
                        logging.info(f"表 {table_name} 存在，数据量: {row_count}")
                        df = pd.concat([df, pd.DataFrame(
                            {'Module': [module], 'Table Name': [table_name], 'Chinese Name': [chinese_name],
                             'Exists': ['Table'], 'Row Count': [row_count]})], ignore_index=True)
                    elif object_type == 'VIEW':
                        logging.info(f"视图 {table_name} 存在")
                        df = pd.concat([df, pd.DataFrame(
                            {'Module': [module], 'Table Name': [table_name], 'Chinese Name': [chinese_name],
                             'Exists': ['View'], 'Row Count': ['']})], ignore_index=True)
                    else:
                        logging.info(f"对象 {table_name} 存在，类型为 {object_type}")
                        df = pd.concat([df, pd.DataFrame(
                            {'Module': [module], 'Table Name': [table_name], 'Chinese Name': [chinese_name],
                             'Exists': [object_type], 'Row Count': ['']})], ignore_index=True)
                else:
                    logging.warning(f"对象 {table_name} 不存在")
                    df = pd.concat([df, pd.DataFrame(
                        {'Module': [module], 'Table Name': [table_name], 'Chinese Name': [chinese_name],
                         'Exists': ['Not Found'], 'Row Count': ['']})], ignore_index=True)
                    module_not_found += 1
            except cx_Oracle.DatabaseError as e:
                error, = e.args
                logging.error(f"查询对象 {table_name} 出错: {error.message}")
                df = pd.concat([df, pd.DataFrame(
                    {'Module': [module], 'Table Name': [table_name], 'Chinese Name': [chinese_name],
                     'Exists': ['Error'], 'Row Count': ['']})], ignore_index=True)
                module_not_found += 1

        # 更新总计数
        total_tables += module_total
        not_found_count += module_not_found

        # 打印模块统计信息
        logging.info(f"模块 {module} 中找到 {module_total - module_not_found}/{module_total} 个对象")
        logging.info("-" * 50)

    # 打印总体统计信息
    logging.info("总体统计信息:")
    logging.info(f"总共检查 {total_tables} 个对象，其中 {not_found_count} 个对象不存在")

    # 将结果保存到Excel文件
    df.to_excel(output_file, index=False)
    logging.info(f"结果已保存到文件: {output_file}")

except cx_Oracle.DatabaseError as e:
    logging.error("Oracle数据库连接或查询出错:", exc_info=True)
    sys.exit(1)
finally:
    # 关闭数据库连接
    if 'connection' in locals():
        cursor.close()
        connection.close()
        logging.info("Oracle数据库连接已关闭")
