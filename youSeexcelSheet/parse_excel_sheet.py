# -*- coding: utf-8 -*-
# @File    :   parse_excel_sheet.py
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/7/5 10:28    Lita       1.0         添加方法解析第二列并保存为txt文件

import pandas as pd
import os

# 指定Excel文件路径和目标sheet名称
excel_file = '/Users/mr.liu/Desktop/有色项目/05_数据范围&&数据字典&&ddl/有色矿业入仓表范围统计-20240711-v2.0.xlsx'
sheet_name = '04_有色数仓入仓表'

# 读取Excel文件中指定sheet页的数据，去掉表头
df = pd.read_excel(excel_file, sheet_name=sheet_name, header=None)

# 提取第一列作为模块名，去掉表头并去重
modules = df.iloc[1:, 0].drop_duplicates().tolist()  # 去掉表头并去重
table_names = df.iloc[1:, 1].tolist()  # 去掉表头

# 构建模块名和对应表名的字典
module_dict = {}
for module in modules:
    if isinstance(module, str):
        module_dict[module] = []

for module, table_name in zip(df.iloc[1:, 0], table_names):
    if isinstance(module, str) and isinstance(table_name, str) and table_name.isascii():
        module_dict[module].append(table_name)


# 新方法：将每个模块的表名分别保存为txt文件
def save_module_table_names(module_dict, output_folder):
    os.makedirs(output_folder, exist_ok=True)

    for module, tables in module_dict.items():
        table_names_str = ','.join(tables)

        output_txt_file = os.path.join(output_folder, f"{module}.txt")
        with open(output_txt_file, 'w', encoding='utf-8') as f:
            f.write(table_names_str)

        print(f'文本文件 {output_txt_file} 已成功生成。')


# 指定输出文件夹路径
output_folder = 'module_txt_files'

# 保存表名
save_module_table_names(module_dict, output_folder)
