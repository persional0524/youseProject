# -*- coding = utf-8 -*-
# @File    :   :compare_csv_excel_columns.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/24 23:29    Lita       1.0         None
import pandas as pd


def compare_csv_excel(csv_file, excel_file):
    """
    比较CSV文件和Excel文件第一个工作表首列字段的差异

    参数:
    csv_file (str): CSV文件路径
    excel_file (str): Excel文件路径

    返回:
    tuple: 三个集合，分别为只在CSV文件中出现的值，只在Excel文件中出现的值，以及两者都出现的值
    """
    # 读取CSV文件的第一列
    csv_data = pd.read_csv(csv_file, usecols=[0])
    csv_first_col = set(csv_data.iloc[:, 0])

    # 读取Excel文件第一个工作表的第一列，并去掉ODS_前缀
    excel_data = pd.read_excel(excel_file, usecols=[0], engine='openpyxl')
    excel_data.iloc[:, 0] = excel_data.iloc[:, 0].str.replace('^ODS_', '', regex=True)
    excel_first_col = set(excel_data.iloc[:, 0])

    # 找出差异
    csv_only = csv_first_col - excel_first_col
    excel_only = excel_first_col - csv_first_col
    common = csv_first_col & excel_first_col

    return csv_only, excel_only, common


def save_to_file(data, filename):
    """
    将集合数据保存到文件

    参数:
    data (set): 要保存的数据
    filename (str): 保存的文件名
    """
    with open(filename, 'w') as f:
        for item in data:
            f.write(f"{item}\n")


if __name__ == "__main__":
    # 指定CSV文件和Excel文件的路径
    csv_file = '/Users/mr.liu/Desktop/有色项目/SYS_USER_TABLES.csv'
    excel_file = '/Users/mr.liu/Desktop/有色项目/ODS_USER_TABLES.xlsx'

    csv_only, excel_only, common = compare_csv_excel(csv_file, excel_file)

    # 输出结果到文件
    save_to_file(csv_only, 'csv_only.txt')
    save_to_file(excel_only, 'excel_only.txt')
    save_to_file(common, 'common.txt')

    print("结果已保存到文件：csv_only.txt, excel_only.txt, common.txt")
