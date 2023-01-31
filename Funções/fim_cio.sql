CREATE OR REPLACE FUNCTION termino_cio
    (p_id IN tb_cachorro_detalhe.idcachorro%type)
    RETURN tb_cachorro_detalhe.ult_cio%type
IS
    v_fim_cio tb_cachorro_detalhe.ult_cio%type;
BEGIN
    SELECT ult_cio+15 INTO v_fim_cio FROM tb_cachorro_detalhe WHERE idcachorro = p_id;
    RETURN v_fim_cio;
END;
