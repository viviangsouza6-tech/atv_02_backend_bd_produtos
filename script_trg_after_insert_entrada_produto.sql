DELIMITER $$

CREATE TRIGGER trg_after_insert_entrada_produto
AFTER INSERT ON entrada_produto
FOR EACH ROW
BEGIN
    DECLARE v_codigo_preco INT;
    DECLARE v_idproduto INT;

    SELECT p.idproduto, p.codigo_preco 
    INTO v_idproduto, v_codigo_preco
    FROM produto p
    WHERE p.iditem = NEW.iditem;

    UPDATE item i
    SET 
        i.preco = NEW.valor_unitario_entrada,
        i.preco_venda = fn_calcular_preco_venda(NEW.valor_unitario_entrada, v_codigo_preco)
    WHERE i.iditem = NEW.iditem;

    UPDATE estoque
    SET quantidade_estoque = quantidade_estoque + NEW.quantidade_entrada
    WHERE idproduto = v_idproduto;
END $$

DELIMITER ;