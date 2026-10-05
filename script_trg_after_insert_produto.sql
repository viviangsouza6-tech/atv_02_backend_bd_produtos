USE `bd_aula_backend`;

DELIMITER $$

CREATE TRIGGER trg_after_insert_produto 
AFTER INSERT ON produto 

FOR EACH ROW 

BEGIN     
INSERT INTO estoque (iditem, quantidade_estoque)     
VALUES (NEW.iditem, 0); END $$

DELIMITER ;