create view vw_produtos_categorias_estoque as
select
    p.idproduto, i.item, c.categoria, e.quantidade_estoque
from produto p
inner join item i
    on p.iditem = i.iditem
inner join categoria c
    on i.idcategoria = c.idcategoria
inner join estoque e
    on e.iditem = p.iditem;
    
select * from vw_produtos_categorias_estoque;