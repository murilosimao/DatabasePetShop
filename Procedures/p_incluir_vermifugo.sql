CREATE OR REPLACE PROCEDURE incluir_vermifugo_cachorro
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_funcao IN NUMBER, p_data_inclusao IN tb_cachorro_detalhe.vermifugo_1_dose%type) -- 1 - 1a dose || 2 - 2a dose
IS
BEGIN
    IF p_funcao = 1 THEN
        UPDATE tb_cachorro_detalhe SET vermifugo_1_dose = TO_DATE(p_data_inclusao, 'DD-MM-YY') WHERE idcachorro = p_id;
    ELSIF p_funcao = 2 THEN
        UPDATE tb_cachorro_detalhe SET vermifugo_2_dose = TO_DATE(p_data_inclusao, 'DD-MM-YY') WHERE idcachorro = p_id;
    END IF;
    COMMIT;
END incluir_vermifugo_cachorro;