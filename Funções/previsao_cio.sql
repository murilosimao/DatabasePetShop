CREATE OR REPLACE FUNCTION previsao_cio
    (p_id IN tb_cachorro_detalhe.idcachorro%type)
    RETURN tb_cachorro_detalhe.ult_cio%type
IS
    v_proxima_data tb_cachorro_detalhe.ult_cio%type;
BEGIN
    SELECT ult_cio+65 INTO v_proxima_data FROM tb_cachorro_detalhe WHERE idcachorro = p_id;
    RETURN v_proxima_data;
END;