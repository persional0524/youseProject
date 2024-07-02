# -*- coding = utf-8 -*-
# @File    :   :testOracle.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/25 09:20    Lita       1.0         None /opt/oracle/instantclient_19_16/libclntsh.dylib


import cx_Oracle  # 导入模块
import os

os.environ['DYLD_LIBRARY_PATH'] = '/opt/oracle/instantclient_19_16:' + os.environ.get(
    '/opt/oracle/instantclient_19_16/libclntsh.dylib', '')

import cx_Oracle

print(cx_Oracle.__file__)

import sys
import os

# try:
#     if sys.platform.startswith("darwin"):
#         lib_dir = os.path.join(os.environ.get("HOME"), "Downloads",
#                                "instantclient_19_6")
#         cx_Oracle.init_oracle_client(lib_dir=lib_dir)
#     elif sys.platform.startswith("win32"):
#         # lib_dir = "/Users/mr.liu/Downloads/instantclient-basic-macos.x64-19.16.0.0.0dbru.dmg/instantclient_19_6"
#         lib_dir = "/opt/oracle/instantclient_19_16"
#         cx_Oracle.init_oracle_client(lib_dir=lib_dir)
# except Exception as err:
#     print("Whoops!")
#     print(err)
#     sys.exit(1)

con = cx_Oracle.connect('ysky_sms', '11111111', '10.63.8.31:1521/ysky')  # 创建连接
curs = con.cursor()  # 创建游标
sql = """SELECT table_name FROM user_tables"""  # 你写的sql
sql_conn = curs.execute(sql)  # 执行sql语句
result = curs.fetchone()  # 获取一条数据
print(result)  # 打印数据
curs.close()  # 关闭游标
con.close()  # 关闭数据库连接
