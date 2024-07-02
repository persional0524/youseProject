# -*- coding = utf-8 -*-
# @File    :   :youseDev_oracle_table_counts.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/24 15:01    Lita       1.0         None
import cx_Oracle
import csv

# 替换为你的Oracle数据库连接信息
username = 'ysky_sms'
password = '11111111'
dsn = '10.63.8.31:1521/ysky'

# 建立与Oracle数据库的连接
connection = cx_Oracle.connect(username, password, dsn)
cursor = connection.cursor()

# 查询所有表名
cursor.execute("""
    SELECT table_name
    FROM user_tables
""")
tables = cursor.fetchall()

# 打开一个CSV文件，用于写入结果
with open('table_data_count.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Table Name', 'Row Count'])

    # 查询每个表的数据量大小
    for table in tables:
        table_name = table[0]
        cursor.execute(f'SELECT COUNT(*) FROM {table_name}')
        row_count = cursor.fetchone()[0]
        writer.writerow([table_name, row_count])

# 关闭数据库连接
cursor.close()
connection.close()

print("Data count has been written to 'table_data_count.csv'")
