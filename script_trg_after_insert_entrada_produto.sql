DELIMITER $$

CREATE TRIGGER trg_after_insert_entrada_produto
AFTER INSERT ON entrada_produto
FOR EACH ROW
BEGIN
    -- 1. Atualiza o preço unitário e o preço de venda na tabela item
    UPDATE item
    SET 
        preco = NEW.valor_unitario_entrada,
        preco_venda = fn_calcular_preco_venda(NEW.valor_unitario_entrada, NEW.codigo_preco)
    WHERE iditem = NEW.iditem;

    -- 2. Atualiza a quantidade acumulada no estoque
    UPDATE estoque
    SET quantidade_estoque = quantidade_estoque + NEW.quantidade_entrada
    WHERE idproduto = NEW.idproduto;
END $$

DELIMITER ;