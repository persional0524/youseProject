# -*- coding = utf-8 -*-
# @File    :   :youseDev_oracle_table_counts.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/24 15:01    Lita       1.0         None

import cx_Oracle
import logging

# 配置日志
logging.basicConfig(filename='table_counts.log', level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

# 连接到Oracle数据库
dsn_tns = cx_Oracle.makedsn('10.63.8.31', '1521', service_name='ysky')
connection = cx_Oracle.connect(user='ysky_sms', password='11111111', dsn=dsn_tns)

try:
    # 创建一个游标
    cursor = connection.cursor()

    # 获取所有表的列表
    cursor.execute("""
        SELECT table_name 
        FROM user_tables
    """)
    tables = cursor.fetchall()

    # 查询每个表的数据量
    for table in tables:
        table_name = table[0]
        cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
        count = cursor.fetchone()[0]

        # 打印到控制台
        print(f"Table: {table_name}, Count: {count}")

        # 记录到日志
        logging.info(f"Table: {table_name}, Count: {count}")

finally:
    # 关闭游标和连接
    cursor.close()
    connection.close()
