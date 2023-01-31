CREATE OR REPLACE PROCEDURE definir_cruzamento
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_data_cruzamento IN tb_cachorro_detalhe.data_ult_cruzamento%type)
IS
BEGIN
    
    UPDATE tb_cachorro_detalhe SET data_ult_cruzamento = TO_DATE(p_data_cruzamento, 'DD-MM-YY') WHERE idcachorro = p_id;
    COMMIT;
END definir_cruzamento;