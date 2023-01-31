CREATE OR REPLACE PACKAGE INSERT_PACK
IS

    PROCEDURE definir_maturidade_cio_cachoro
        (p_id IN tb_cachorro_detalhe.idcachorro%type, p_data_inclusao IN tb_cachorro_detalhe.maturidade_cio%type);
    
    PROCEDURE incluir_remedio_carrapato_cachorro
        (p_id IN tb_cachorro_detalhe.idcachorro%type, p_data_inclusao IN tb_cachorro_detalhe.remedio_carrapato%type);
    
    PROCEDURE incluir_vacina_cachorro
        (p_id IN tb_cachorro_detalhe.idcachorro%type, p_vacinado IN tb_cachorro_detalhe.vacinado%type);
    
    PROCEDURE incluir_vermifugo_cachorro
        (p_id IN tb_cachorro_detalhe.idcachorro%type, p_funcao IN NUMBER, p_data_inclusao IN tb_cachorro_detalhe.vermifugo_1_dose%type);

END;

CREATE OR REPLACE PACKAGE BODY INSERT_PACK
IS

PROCEDURE definir_maturidade_cio_cachoro
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_data_inclusao IN tb_cachorro_detalhe.maturidade_cio%type)
IS
BEGIN
    
    UPDATE tb_cachorro_detalhe SET maturidade_cio = TO_DATE(p_data_inclusao, 'DD-MM-YY') WHERE idcachorro = p_id;
    COMMIT;
END definir_maturidade_cio_cachoro;

PROCEDURE incluir_remedio_carrapato_cachorro
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_data_inclusao IN tb_cachorro_detalhe.remedio_carrapato%type) -- 1 - 1a dose || 2 - 2a dose
IS
BEGIN
    UPDATE tb_cachorro_detalhe SET remedio_carrapato = TO_DATE(p_data_inclusao, 'DD-MM-YY') WHERE idcachorro = p_id;
    COMMIT;
END incluir_remedio_carrapato_cachorro;

PROCEDURE incluir_vacina_cachorro
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_vacinado IN tb_cachorro_detalhe.vacinado%type) -- 1 - 1a dose || 2 - 2a dose
IS
BEGIN
    
    UPDATE tb_cachorro_detalhe SET vacinado = p_vacinado WHERE idcachorro = p_id;
    COMMIT;
END incluir_vacina_cachorro;

PROCEDURE incluir_vermifugo_cachorro
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

END;