DELIMITER $$

CREATE TRIGGER trg_after_insert_produto
AFTER INSERT ON produto
FOR EACH ROW
BEGIN
    INSERT INTO estoque (idproduto, quantidade_estoque)
    VALUES (NEW.idproduto, 0);
END $$

DELIMITER ;