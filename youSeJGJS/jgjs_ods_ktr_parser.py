# -*- coding = utf-8 -*-
# @File    :   :jgjs_ods_ktr_parser.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/7/17 14:28    Lita       1.0         None

import os
import xml.etree.ElementTree as ET
import re

# 指定要遍历的文件夹路径
folder_path = "/Users/mr.liu/Desktop/有色项目/05_数据范围&&数据字典&&ddl/有色监管集市kettle/RFBS-Service-CFG/dmKettle"


def parse_sql(sql_text):
    # 匹配表名和字段名的正则表达式
    table_pattern = re.compile(r'(?:FROM|JOIN)\s+(\w+)\s*', re.IGNORECASE)
    field_pattern = re.compile(r'\.\s*(\w+)\s*(?=[,\s])')

    # 查找所有表名
    tables = table_pattern.findall(sql_text)

    # 查找所有字段名
    fields = field_pattern.findall(sql_text)

    return tables, fields


def parse_step(step, ktr_name, output_folder):
    # 获取步骤类型和名称
    step_type = step.get('type', 'N/A')
    step_name = step.find('name').text if step.find('name') is not None else 'N/A'

    # 创建对应的 SQL 文件
    sql_file_name = os.path.join(output_folder, f"{ktr_name}_{step_name}.sql")
    with open(sql_file_name, 'w', encoding='utf-8') as sql_file:
        sql_file.write(f"-- 步骤类型: {step_type}, 步骤名称: {step_name}\n")

        # 查找并写入步骤的所有子元素
        for element in step.findall('*'):
            if element.tag == 'sql':  # 如果是 SQL 元素，则写入 SQL 语句
                sql_text = element.text.strip() if element.text else 'N/A'
                sql_file.write(f"{sql_text}\n\n")
            else:
                # 写入其他元素的标签、属性和内容
                sql_file.write(f"-- 标签: {element.tag}, 属性: {element.attrib}, 内容: {element.text}\n")

    print(f"已将步骤写入文件: {sql_file_name}")


# 创建输出 SQL 文件的文件夹
output_sql_folder = "RFBS解析出的SQL文件"
os.makedirs(output_sql_folder, exist_ok=True)

# 遍历文件夹
print("开始遍历文件夹...")
file_count = 0
for root, dirs, files in os.walk(folder_path):
    ktr_files = [f for f in files if f.endswith('.ktr')]

    for ktr_file in ktr_files:
        file_count += 1
        file_path = os.path.join(root, ktr_file)
        ktr_name = os.path.splitext(ktr_file)[0]  # 获取 KTR 文件的名称，用于生成 SQL 文件

        # 打印文件路径
        print(f"{file_count}: 发现文件: {file_path}")

        try:
            # 解析 KTR 文件
            tree = ET.parse(file_path)
            ktr_root = tree.getroot()

            # 创建该 KTR 文件对应的 SQL 输出文件夹
            ktr_output_folder = os.path.join(output_sql_folder, ktr_name)
            os.makedirs(ktr_output_folder, exist_ok=True)

            # 找到所有步骤
            steps = ktr_root.findall('.//step')
            if steps:
                for step in steps:
                    parse_step(step, ktr_name, ktr_output_folder)

            print("-" * 50)

        except Exception as e:
            print(f"解析文件失败: {file_path} - 错误: {e}")
            print("-" * 50)
