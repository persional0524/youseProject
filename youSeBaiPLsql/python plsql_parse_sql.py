import os
import re

# 字典，用于将中文注释翻译为英文
translation_dict = {
    '银行': 'bank',
    '编号': 'code',
    '名称': 'name',
    '简写': 'abbreviation',
    '策略': 'strategy',
    '标志': 'flag',
    '连接': 'connect',
    '创建': 'created',
    '文档': 'document',
    '日期': 'date',
    '字典': 'dictionary',
    '导入': 'import',
    '区域': 'region',
    '客户': 'client',
    '预算': 'budget',
    '历史': 'history',
    '投资': 'investment',
    '储蓄': 'savings',
    '测试': 'test',
    '成就': 'achievement',
    '复杂': 'complex',
    '财务': 'finance',
    '指标': 'indicator',
    '风险': 'risk',
    '警告': 'warning',
    '值': 'value',
    '银行编号': 'bank code',
    '银行名称': 'bank name',
    '银行缩写': 'bank abbreviation',
    '连接标志': 'connect flag'
}


# 函数，将SQL文件中的中文注释翻译为英文
def translate_chinese_to_english(sql_content):
    for chinese, english in translation_dict.items():
        sql_content = re.sub(chinese, english, sql_content)
    return sql_content


# 函数，用于预处理SQL语句
def preprocess_sql(sql_content):
    # 替换特殊字符，修复常见语法问题
    sql_content = sql_content.replace('（', '(').replace('）', ')').replace('；', ';')

    # 修复特定错误
    sql_content = re.sub(r'comment on table (\w+\.\w+)\.', r'comment on table \1 is ', sql_content)
    sql_content = re.sub(r'comment on column (\w+\.\w+)\.', r'comment on column \1 is ', sql_content)

    return sql_content


# 函数，解析SQL文件并将表创建语句和注释按表名分类
def parse_sql_file(file_path):
    with open(file_path, 'r', encoding='gb2312') as file:
        sql_content = file.read()

    # 翻译SQL内容中的中文注释
    translated_sql_content = translate_chinese_to_english(sql_content)

    # 预处理SQL语句
    translated_sql_content = preprocess_sql(translated_sql_content)

    # 定义正则表达式模式，识别表创建语句和注释
    table_creation_pattern = re.compile(r'(create table \w+\.\w+.*?;)', re.DOTALL | re.IGNORECASE)
    comment_pattern = re.compile(r'(comment on \w+ \w+\.\w+.*?;)', re.DOTALL | re.IGNORECASE)

    # 找到所有表创建语句和注释
    table_creations = table_creation_pattern.findall(translated_sql_content)
    comments = comment_pattern.findall(translated_sql_content)

    # 存储分类后的SQL文件的目录
    base_dir = 'SQL_Categories_Translated'

    # 清空之前的文件夹及其内容
    if os.path.exists(base_dir):
        for root, dirs, files in os.walk(base_dir, topdown=False):
            for name in files:
                os.remove(os.path.join(root, name))
            for name in dirs:
                os.rmdir(os.path.join(root, name))

    os.makedirs(base_dir, exist_ok=True)

    # 字典，用于按表名存储SQL语句
    categorized_sql = {}

    for statement in table_creations + comments:
        # 获取表名
        table_name_match = re.search(r'create table (\w+)\.(\w+)', statement, re.IGNORECASE)
        if table_name_match:
            schema, table = table_name_match.groups()
        else:
            comment_table_name_match = re.search(r'comment on (table|column) (\w+)\.(\w+)', statement, re.IGNORECASE)
            if comment_table_name_match:
                _, schema, table = comment_table_name_match.groups()
            else:
                continue

        if table not in categorized_sql:
            categorized_sql[table] = []

        categorized_sql[table].append(statement)

    # 将每个表的SQL语句保存到单独的文件中
    for table, statements in categorized_sql.items():
        file_path = os.path.join(base_dir, f'{table}.sql')
        with open(file_path, 'w', encoding='utf-8') as file:
            for statement in statements:
                file.write(statement + '\n')

    return categorized_sql


# 执行解析和翻译的函数
file_path = '/Users/mr.liu/Desktop/有色项目/01_百联资料/DW.sql'  # 请将此路径替换为您的SQL文件路径
categorized_sql_statements = parse_sql_file(file_path)

print("SQL文件解析和分类完成")
