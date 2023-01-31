CREATE OR REPLACE FUNCTION obter_segunda_dose_vermifugo
    (p_id IN tb_cachorro_detalhe.idcachorro%type)
    RETURN tb_cachorro_detalhe.vermifugo_2_dose%type
IS
    v_proxima_data tb_cachorro_detalhe.vermifugo_2_dose%type;
BEGIN
    SELECT vermifugo_1_dose+15 INTO v_proxima_data FROM tb_cachorro_detalhe WHERE idcachorro = p_id;
    RETURN v_proxima_data;
END;

VARIABLE g_proxima_data VARCHAR2(100)
EXECUTE :g_proxima_data:=obter_data_proximo_vermifugo(2)
PRINT g_proxima_data
