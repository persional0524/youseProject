import cx_Oracle

# Oracle数据库的连接信息
username = 'ysky_sms'
password = '11111111'
host = '10.63.8.31'
port = 1521
service_name = 'ysky'

# 构建DSN
dsn_tns = cx_Oracle.makedsn(host=host, port=port, service_name=service_name)

try:
    # 创建连接
    connection = cx_Oracle.connect(user=username, password=password, dsn=dsn_tns)

    # 创建一个游标
    cursor = connection.cursor()

    # 执行查询
    cursor.execute("SELECT * FROM your_table")  # 请将'your_table'替换为你实际的表名

    # 获取查询结果
    for row in cursor:
        print(row)

except cx_Oracle.DatabaseError as e:
    # 捕获数据库错误
    print(f"Database error occurred: {e}")

