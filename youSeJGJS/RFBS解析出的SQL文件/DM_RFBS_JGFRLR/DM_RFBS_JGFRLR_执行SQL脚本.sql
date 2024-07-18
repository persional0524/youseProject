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
update  DM_RFBS_JGFRLR A set yysr=(select  TO_CHAR(b.yysr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             lxjsr=(select  TO_CHAR(b.lxjsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             lxsr=(select  TO_CHAR(b.lxsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             jrjgwllxsr=(select  TO_CHAR(b.jrjgwllxsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             xtnwllxsr=(select  TO_CHAR(b.xtnwllxsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             gxdklxsr=(select  TO_CHAR(b.gxdklxsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zqlxsr=(select  TO_CHAR(b.zqlxsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             qtlxsr=(select  TO_CHAR(b.qtlxsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             lxzc=(select  TO_CHAR(b.lxzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             jrjgwllxzc=(select  TO_CHAR(b.jrjgwllxzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             xtnwllxzc=(select  TO_CHAR(b.xtnwllxzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             gxdklxzc=(select  TO_CHAR(b.gxdklxzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zqlxzc=(select  TO_CHAR(b.zqlxzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             qtlxzc=(select  TO_CHAR(b.qtlxzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             sxfjyjjsr=(select  TO_CHAR(b.sxfjyjjsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),  
                             sxfjyjsr=(select  TO_CHAR(b.sxfjyjsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             sxfjyjzc=(select  TO_CHAR(b.sxfjyjzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zlsy=(select  TO_CHAR(b.zlsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             tzsy=(select  TO_CHAR(b.tzsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zqtzsy=(select  TO_CHAR(b.zqtzsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             gqtzsy=(select  TO_CHAR(b.gqtzsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             qttzsy=(select  TO_CHAR(b.qttzsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             gyjzbdsy=(select  TO_CHAR(b.gyjzbdsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             hdjsy=(select  TO_CHAR(b.hdjsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zcczsy=(select  TO_CHAR(b.zcczsy,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             qtywsr=(select  TO_CHAR(b.qtywsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yyzc=(select  TO_CHAR(b.yyzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             ywjglf=(select  TO_CHAR(b.ywjglf,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zggz=(select  TO_CHAR(b.zggz,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             flf=(select  TO_CHAR(b.flf,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zfgjjhzfbt=(select  TO_CHAR(b.zfgjjhzfbt,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             sjjfj=(select  TO_CHAR(b.sjjfj,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             qtywzc=(select  TO_CHAR(b.qtywzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yylr=(select  TO_CHAR(b.yylr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yywsr=(select  TO_CHAR(b.yywsr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yywzc=(select  TO_CHAR(b.yywzc,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             lrze=(select  TO_CHAR(b.lrze,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             sds=(select  TO_CHAR(b.sds,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             jlr=(select  TO_CHAR(b.jlr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             ndsytz=(select  TO_CHAR(b.ndsytz,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             lclr=(select  TO_CHAR(b.lclr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             wfplr=(select  TO_CHAR(b.wfplr,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             ynzzs=(select  TO_CHAR(b.ynzzs,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),  
                             hxyjzbje=(select  TO_CHAR(b.hxyjzbje,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yjzbje=(select  TO_CHAR(b.yjzbje,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             zbje=(select  TO_CHAR(b.zbje,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' ),
                             yyzbdxjjzhdfxjqzchj=(select  TO_CHAR(b.yyzbdxjjzhdfxjqzchj,'fm99999999999999999999999999990.'||rpad(0,'2',0))  from DM_RFBS_JGFRLR B WHERE A.report_id=b.report_id  and A.report_id='${reportId}' )
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
      
