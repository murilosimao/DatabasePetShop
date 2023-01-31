SET SERVEROUTPUT ON;


select * from tb_cachorro_detalhe;


update tb_cachorro_detalhe 
set vacinado = NULL
,vermifugo_2_dose = null
,maturidade_cio = null
,data_ult_cruzamento = null
,remedio_carrapato = null
,ult_cio = null
where idcachorro = 1;



EXECUTE incluir_vermifugo_cachorro(1,2,TO_DATE('16-07-21','dd-mm-yy'))
EXECUTE incluir_vacina_cachorro(1,TO_DATE('19-11-21','dd-mm-yy'))
EXECUTE incluir_remedio_carrapato_cachorro(1,TO_DATE('21-08-21','dd-mm-yy'))
EXECUTE definir_cruzamento(1,TO_DATE('15-11-21','dd-mm-yy'))
EXECUTE definir_maturidade_cio_cachoro(1,TO_DATE('05-11-21','dd-mm-yy'))
EXECUTE definir_ult_cio()

-- Esquema de Lembrete
DECLARE
    CURSOR cur_idCachorro IS SELECT * FROM v_proximo_remedio_carrapato WHERE proxima_dose BETWEEN SYSDATE AND SYSDATE+2;
    v_id v_proximo_remedio_carrapato.idcachorro%type;
    v_data_atual v_proximo_remedio_carrapato.remedio_carrapato%type;
    v_prox_data v_proximo_remedio_carrapato.proxima_dose%type;
BEGIN
    OPEN cur_idCachorro;
    LOOP 
        FETCH cur_idCachorro INTO v_id, v_data_atual, v_prox_data;
    EXIT WHEN cur_idCachorro%NOTFOUND;
        dbms_output.put_line('ID = ' || v_id || ' Ultima data = ' || v_data_atual || ' Proxima data = '|| v_prox_data);
        --IF v_id IS NOT NULL THEN
            --BEGIN
            --send_mail_test.mail_test('murilo.m.simao@gmail.com',  'Remédio contra carrapato', 'ID = ' || v_id || ' Ultima data = ' || v_data_atual || ' Proxima data = '|| v_prox_data);
            --END;
        --END IF;  
    END LOOP;
    CLOSE cur_idCachorro;
END;



VARIABLE g_proxima_data VARCHAR2(100)
EXECUTE :g_proxima_data:=previsao_cio(1)
PRINT g_proxima_data
