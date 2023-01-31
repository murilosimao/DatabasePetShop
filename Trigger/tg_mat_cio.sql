create or replace TRIGGER TG_MATURIDADE_CIO
    AFTER INSERT OR UPDATE OR DELETE ON tb_cachorro_detalhe
BEGIN
    DECLARE
    CURSOR cur_idCachorro IS SELECT IDCACHORRO, maturidade_cio, ult_cio FROM TB_CACHORRO_DETALHE WHERE maturidade_cio IS NOT NULL AND ult_cio IS NULL;
    v_id tb_cachorro_detalhe.idcachorro%type;
    v_mat_cio tb_cachorro_detalhe.maturidade_cio%type;
    v_ult_cio tb_cachorro_detalhe.ult_cio%type;
    BEGIN
        OPEN cur_idCachorro;
        LOOP 
            FETCH cur_idCachorro INTO v_id, v_mat_cio, v_ult_cio;
        EXIT WHEN cur_idCachorro%NOTFOUND;
            UPDATE tb_cachorro_detalhe SET ult_cio =  v_mat_cio WHERE idcachorro = v_id;
        END LOOP;
        CLOSE cur_idCachorro;
    END;
END;