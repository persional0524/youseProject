# -*- coding = utf-8 -*-
# @File    :   :parse_excel_sheet.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/7/5 10:28    Lita       1.0         None
import pandas as pd
import json

# 指定Excel文件路径和目标sheet名称
excel_file = '/Users/mr.liu/Desktop/有色项目/有色矿业入仓表范围统计.xlsx'
sheet_name = '04_有色数仓入仓表'

# 读取Excel文件中指定sheet页的数据，去掉表头
df = pd.read_excel(excel_file, sheet_name=sheet_name, header=None)

# 提取第一列作为模块名，第二列作为表名
modules = df.iloc[1:, 0].tolist()  # 去掉表头
table_names = df.iloc[1:, 1].tolist()  # 去掉表头

# 构建模块名和对应表名的字典
module_dict = {}
for module, table_name in zip(modules, table_names):
    if isinstance(module, str) and isinstance(table_name, str):
        if module not in module_dict:
            module_dict[module] = []
        module_dict[module].append(table_name)

# 构建输出JSON文件路径
output_file = 'parsed_data.json'

# 写入JSON文件
with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(module_dict, f, ensure_ascii=False, indent=4)

print(f'JSON文件 {output_file} 已成功生成。')
