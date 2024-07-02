# -*- coding = utf-8 -*-
# @File    :   :kettle_transformation_parser.py    
# @Contact :   liutao0705@live.com
# @License :   (C)Copyright 2021-2022

# @Modify Time      @Author    @Version    @Desciption
# ------------      -------    --------    -----------
# 2024/6/28 14:03    Lita       1.0         None
import xml.etree.ElementTree as ET
import json
import time

# Load the XML file
file_path = '111.xml'
start_time = time.time()
tree = ET.parse(file_path)
root = tree.getroot()
end_time = time.time()
print(f"XML 文件加载时间: {end_time - start_time} 秒")


# Function to extract text from an element, handling NoneType
def get_text(element, tag):
    child = element.find(tag)
    return child.text if child is not None else ''


# Extracting job entries and hops from the XML
entries = []
hops = []

# Extract job entries
start_time = time.time()
for job_entry in root.findall('.//entry'):
    entry_info = {
        'name': get_text(job_entry, 'name'),
        'type': get_text(job_entry, 'type'),
        'directory': get_text(job_entry, 'directory'),
        'transname': get_text(job_entry, 'transname'),
        'loglevel': get_text(job_entry, 'loglevel'),
        'run_configuration': get_text(job_entry, 'run_configuration'),
        'sql': []
    }

    # Extract SQL statements if present
    sql_elements = job_entry.findall('.//sql')
    for sql_element in sql_elements:
        sql_text = sql_element.text.strip() if sql_element.text else ''
        entry_info['sql'].append(sql_text)

    entries.append(entry_info)
end_time = time.time()
print(f"作业条目提取时间: {end_time - start_time} 秒")

# Extract hops
start_time = time.time()
for hop in root.findall('.//hop'):
    hop_info = {
        'from': get_text(hop, 'from'),
        'to': get_text(hop, 'to'),
        'enabled': get_text(hop, 'enabled'),
        'unconditional': get_text(hop, 'unconditional'),
    }
    hops.append(hop_info)
end_time = time.time()
print(f"连接关系提取时间: {end_time - start_time} 秒")

# Mapping out the transformation relationships
start_time = time.time()
transformation_map = {}
for hop in hops:
    if hop['from'] not in transformation_map:
        transformation_map[hop['from']] = []
    transformation_map[hop['from']].append(hop['to'])
end_time = time.time()
print(f"转换关系映射时间: {end_time - start_time} 秒")

# Printing the extracted information in a structured format
start_time = time.time()


def print_job_info(entries, transformation_map):
    for entry in entries:
        print(f"任务名称: {entry['name']}")
        print(f"类型: {entry['type']}")
        print(f"目录: {entry['directory']}")
        print(f"转换名称: {entry['transname']}")
        print(f"日志级别: {entry['loglevel']}")
        print(f"运行配置: {entry['run_configuration']}")

        if entry['name'] in transformation_map:
            print(f"输出到: {', '.join(transformation_map[entry['name']])}")

        if entry['sql']:
            print("SQL 逻辑:")
            for sql in entry['sql']:
                print(sql)
        print('-' * 40)


# Print job information
print_job_info(entries, transformation_map)
end_time = time.time()
print(f"控制台打印时间: {end_time - start_time} 秒")

# Save the extracted information to a JSON file
start_time = time.time()
output_data = {
    'entries': entries,
    'hops': hops,
    'transformation_map': transformation_map
}

output_file_path = 'parsed_kettle_output.json'
with open(output_file_path, 'w', encoding='utf-8') as f:
    json.dump(output_data, f, indent=2, ensure_ascii=False)
end_time = time.time()
print(f"文件写入时间: {end_time - start_time} 秒")

total_execution_time = time.time() - start_time
print(f"总执行时间: {total_execution_time} 秒")
