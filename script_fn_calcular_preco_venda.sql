DELIMITER $$

CREATE FUNCTION fn_calcular_preco_venda(
    p_preco DECIMAL(10,2),
    p_codigo_preco INT
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_preco_venda DECIMAL(10,2);

    CASE p_codigo_preco
        WHEN 1 THEN
            SET v_preco_venda = p_preco * 1.04; # acrescimo de 4%
        WHEN 2 THEN
            SET v_preco_venda = p_preco * 1.08; # acrescimo de 8%
        WHEN 3 THEN
            SET v_preco_venda = p_preco * 1.10; # acrescimo de 10%
        ELSE
            SET v_preco_venda = p_preco; 
    END CASE;

    RETURN v_preco_venda;
END $$

DELIMITER ;