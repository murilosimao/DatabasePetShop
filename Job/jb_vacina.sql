BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"C##SCOTT".""',
            schedule_name => '"SYS"."DAILY_PURGE_SCHEDULE"',
            job_type => 'PLSQL_BLOCK',
            job_action => 'DECLARE
    CURSOR cur_idCachorro IS SELECT * FROM v_proxima_dose_vacina WHERE proxima_dose BETWEEN SYSDATE+7 AND SYSDATE;
    v_id v_proximo_remedio_carrapato.idcachorro%type;
    v_data_atual v_proximo_remedio_carrapato.remedio_carrapato%type;
    v_prox_data v_proximo_remedio_carrapato.proxima_dose%type;
BEGIN
    OPEN cur_idCachorro;
    LOOP 
        FETCH cur_idCachorro INTO v_id, v_data_atual, v_prox_data;
    EXIT WHEN cur_idCachorro%NOTFOUND;
        --DBMS_OUTPUT.PUT_LINE(''ID = '' || v_id || '' Ultima data = '' || v_data_atual || '' Proxima data = ''|| v_prox_data);
        IF v_id IS NOT NULL THEN
            BEGIN
            send_mail_test.mail_test(''murilo.m.simao@gmail.com'',  ''Campanha de vacinação'', ''ID = '' || v_id || '' Ultima data = '' || v_data_atual || '' Proxima data = ''|| v_prox_data);
            END;
        END IF;  

    END LOOP;
    CLOSE cur_idCachorro;
END;',
            number_of_arguments => 0,
            enabled => FALSE,
            auto_drop => FALSE,
               
            comments => 'VACINA A CADA ANO COM ALERTA DE 1 SEMANA ANTES');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"C##SCOTT".""', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"C##SCOTT".""', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"C##SCOTT".""');
END;
