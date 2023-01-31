CREATE OR REPLACE PROCEDURE definir_ult_cio
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_ult_cio IN tb_cachorro_detalhe.ult_cio%type)
IS
BEGIN
    
    UPDATE tb_cachorro_detalhe SET ult_cio = TO_DATE(p_ult_cio, 'DD-MM-YY') WHERE idcachorro = p_id;
    COMMIT;
END definir_ult_cio;
