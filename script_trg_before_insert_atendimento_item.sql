DELIMITER $$

CREATE TRIGGER trg_before_insert_atendimento_item
BEFORE INSERT ON atendimento_item
FOR EACH ROW
BEGIN
    DECLARE v_estoque_atual DECIMAL(10,2);

    SELECT e.quantidade_estoque INTO v_estoque_atual
    FROM estoque e
    JOIN produto p ON p.idproduto = e.idproduto
    WHERE p.iditem = NEW.iditem;

    IF v_estoque_atual IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Produto não encontrado ou sem registro no estoque.';
    ELSEIF NEW.quantidade_item > v_estoque_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Quantidade solicitada em atendimento é maior do que a quantidade disponível em estoque.';
    ELSE
        UPDATE estoque e
        JOIN produto p ON p.idproduto = e.idproduto
        SET e.quantidade_estoque = e.quantidade_estoque - NEW.quantidade_item
        WHERE p.iditem = NEW.iditem;
    END IF;
END $$

DELIMITER ;