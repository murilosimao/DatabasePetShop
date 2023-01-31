CREATE OR REPLACE PROCEDURE incluir_remedio_carrapato_cachorro
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_data_inclusao IN tb_cachorro_detalhe.remedio_carrapato%type) -- 1 - 1a dose || 2 - 2a dose
IS
BEGIN
    UPDATE tb_cachorro_detalhe SET remedio_carrapato = TO_DATE(p_data_inclusao, 'DD-MM-YY') WHERE idcachorro = p_id;
    COMMIT;
END incluir_remedio_carrapato_cachorro;
