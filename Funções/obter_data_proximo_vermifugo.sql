CREATE OR REPLACE FUNCTION obter_data_proximo_vermifugo
    (p_id IN tb_cachorro_detalhe.idcachorro%type)
    RETURN tb_cachorro_detalhe.vermifugo_1_dose%type
IS
    v_proxima_data tb_cachorro_detalhe.vermifugo_1_dose%type;
BEGIN
    SELECT vermifugo_2_dose+365 INTO v_proxima_data FROM tb_cachorro_detalhe WHERE idcachorro = p_id;
    RETURN v_proxima_data;
END;