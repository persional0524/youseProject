-- 步骤类型: N/A, 步骤名称: 执行SQL脚本
-- 标签: name, 属性: {}, 内容: 执行SQL脚本
-- 标签: type, 属性: {}, 内容: ExecSQL
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
-- 标签: execute_each_row, 属性: {}, 内容: Y
-- 标签: single_statement, 属性: {}, 内容: N
-- 标签: replace_variables, 属性: {}, 内容: Y
update  DM_RFBS_JGFRZF A set gxck     =(select  TO_CHAR(b.gxck,    'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             gxdk     =(select  TO_CHAR(b.gxdk,    'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zczj     =(select  TO_CHAR(b.zczj,    'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             fzzj     =(select  TO_CHAR(b.fzzj,    'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             syzqyhj  =(select  TO_CHAR(b.syzqyhj, 'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             sxzc     =(select  TO_CHAR(b.sxzc,    'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             fxfz     =(select  TO_CHAR(b.fxfz,    'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             ldxzc    =(select  TO_CHAR(b.ldxzc,   'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             ldxfz    =(select  TO_CHAR(b.ldxfz,   'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zcldk    =(select  TO_CHAR(b.zcldk,   'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             gzldk    =(select  TO_CHAR(b.gzldk,   'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             cjldk    =(select  TO_CHAR(b.cjldk,   'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             kyldk    =(select  TO_CHAR(b.kyldk,   'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             ssldk    =(select  TO_CHAR(b.ssldk,   'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yqdk     =(select  TO_CHAR(b.yqdk,    'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yq90ysdk =(select  TO_CHAR(b.yq90ysdk,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             dkjzzb   =(select  TO_CHAR(b.dkjzzb,  'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRZF B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' )
;
                             commit;

-- 标签: insert_field, 属性: {}, 内容: None
-- 标签: update_field, 属性: {}, 内容: None
-- 标签: delete_field, 属性: {}, 内容: None
-- 标签: read_field, 属性: {}, 内容: None
-- 标签: arguments, 属性: {}, 内容: 
    
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
