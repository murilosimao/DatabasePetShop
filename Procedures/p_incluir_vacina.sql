CREATE OR REPLACE PROCEDURE incluir_vacina_cachorro
    (p_id IN tb_cachorro_detalhe.idcachorro%type, p_vacinado IN tb_cachorro_detalhe.vacinado%type) -- 1 - 1a dose || 2 - 2a dose
IS
BEGIN
    
    UPDATE tb_cachorro_detalhe SET vacinado = p_vacinado WHERE idcachorro = p_id;
    COMMIT;
END incluir_vacina_cachorro;