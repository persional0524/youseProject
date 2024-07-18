-- 步骤类型: N/A, 步骤名称: 根据reportId删除DM_RFBS_FTYDWC表数据
-- 标签: name, 属性: {}, 内容: 根据reportId删除DM_RFBS_FTYDWC表数据
-- 标签: type, 属性: {}, 内容: ExecSQL
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: single_statement, 属性: {}, 内容: N
-- 标签: replace_variables, 属性: {}, 内容: Y
DELETE FROM DM_RFBS_FTYDWC
 WHERE REPORT_ID = '${reportId}'

-- 标签: insert_field, 属性: {}, 内容: None
-- 标签: update_field, 属性: {}, 内容: None
-- 标签: delete_field, 属性: {}, 内容: None
-- 标签: read_field, 属性: {}, 内容: None
-- 标签: arguments, 属性: {}, 内容: 
    
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
