create view vw_servicos_categorias as
select
    i.iditem, i.item, i.descricao_item, c.idcategoria, c.categoria
from item i
inner join categoria c
    on i.idcategoria = c.idcategoria;
    
select * from vw_servicos_categorias;