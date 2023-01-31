CREATE OR REPLACE PROCEDURE definir_maturidade_cio_cachoro
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_data_inclusao IN tb_cachorro_detalhe.maturidade_cio%type)
IS
BEGIN
    
    UPDATE tb_cachorro_detalhe SET maturidade_cio = TO_DATE(p_data_inclusao, 'DD-MM-YY') WHERE idcachorro = p_id;
    COMMIT;
END definir_maturidade_cio_cachoro;
