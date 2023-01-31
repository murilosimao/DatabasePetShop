DECLARE
    CURSOR cur_idCachorro IS SELECT IDCACHORRO, data_ult_cruzamento+30 FROM TB_CACHORRO_DETALHE WHERE data_ult_cruzamento+30 = SYSDATE;
    v_id tb_cachorro_detalhe.idcachorro%type;
    v_prox_data tb_cachorro_detalhe.ult_cio%type;
BEGIN
    OPEN cur_idCachorro;
    LOOP 
        FETCH cur_idCachorro INTO v_id, v_prox_data;
    EXIT WHEN cur_idCachorro%NOTFOUND;
        --DBMS_OUTPUT.PUT_LINE('ID = ' || v_id || ' Proxima data = '|| v_prox_data);
        IF v_id IS NOT NULL THEN
            BEGIN
            send_mail_test.mail_test('murilo.m.simao@gmail.com',  'Agendar Ultrassom', 'ID = ' || v_id || ' Ultima data de cruzamento = ' || v_prox_data);
            END;
        END IF;  
        
    END LOOP;
    CLOSE cur_idCachorro;
END;
