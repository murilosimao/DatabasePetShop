BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"C##SCOTT".""',
            schedule_name => '"SYS"."DAILY_PURGE_SCHEDULE"',
            job_type => 'PLSQL_BLOCK',
            job_action => 'DECLARE
    CURSOR cur_idCachorro IS SELECT IDCACHORRO, ult_cio+150 FROM TB_CACHORRO_DETALHE WHERE ult_cio+150 BETWEEN SYSDATE AND SYSDATE+30;
    v_id tb_cachorro_detalhe.idcachorro%type;
    v_prox_data tb_cachorro_detalhe.ult_cio%type;
BEGIN
    OPEN cur_idCachorro;
    LOOP 
        FETCH cur_idCachorro INTO v_id, v_prox_data;
    EXIT WHEN cur_idCachorro%NOTFOUND;
        --DBMS_OUTPUT.PUT_LINE(''ID = '' || v_id || '' Proxima data = ''|| v_prox_data);
        IF v_id IS NOT NULL THEN
            BEGIN
            send_mail_test.mail_test(''murilo.m.simao@gmail.com'',  ''Próximos CIOs'', ''ID = '' || v_id || '' Proxima data = ''|| v_prox_data);
            END;
        END IF;  

    END LOOP;
    CLOSE cur_idCachorro;
END;',
            number_of_arguments => 0,
            enabled => FALSE,
            auto_drop => FALSE,
               
            comments => '');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"C##SCOTT".""', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"C##SCOTT".""', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"C##SCOTT".""');
END;
