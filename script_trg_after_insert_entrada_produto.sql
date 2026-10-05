DELIMITER $$

CREATE TRIGGER trg_after_insert_entrada_produto
AFTER INSERT ON entrada_produto
FOR EACH ROW
BEGIN
    DECLARE v_codigo_preco INT;

    SELECT codigo_preco INTO v_codigo_preco
    FROM produto
    WHERE idproduto = NEW.idproduto;

    UPDATE item i
    JOIN produto p ON p.iditem = i.iditem
    SET 
        i.preco = NEW.valor_unitario_entrada,
        i.preco_venda = fn_calcular_preco_venda(NEW.valor_unitario_entrada, v_codigo_preco)
    WHERE p.idproduto = NEW.idproduto;

    UPDATE estoque
    SET quantidade_estoque = quantidade_estoque + NEW.quantidade_entrada
    WHERE idproduto = NEW.idproduto;
END $$

DELIMITER ;