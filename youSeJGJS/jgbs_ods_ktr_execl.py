# -*- coding = utf-8 -*-
# @File    :   :jgbs_ods_ktr_execl.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/7/17 15:06    Lita       1.0         None
import os
import re


def parse_sql_files(directory):
    # 遍历目录下的所有文件和文件夹
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".sql"):
                # 构造文件路径
                file_path = os.path.join(root, file)
                print(f"解析文件: {file_path}")

                # 读取文件内容
                with open(file_path, "r", encoding="utf-8") as f:
                    sql_content = f.read()

                    # 使用正则表达式匹配SQL语句
                    sql_statements = re.findall(r'(?ms)^\s*(?!--).*?[^-;]\s*$', sql_content, flags=re.MULTILINE)

                    # 打印匹配到的SQL语句
                    for sql_statement in sql_statements:
                        if sql_statement.strip():
                            print("SQL语句:")
                            print(sql_statement.strip())
                            print("=" * 30)


# RFBS解析出的SQL文件夹路径
directory_to_parse = "RFBS解析出的SQL文件"
parse_sql_files(directory_to_parse)
