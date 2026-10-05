delimiter $$

create procedure pr_cadastrar_produto(
    p_idcategoria int,
    p_item varchar(40),
    p_descricao_item varchar(200),
    p_preco decimal(10,2),
    p_tipo_item char(1),
    p_ativo_produto_servico char(1),
    p_idproduto varchar(45),
    p_codigo_preco int,
    p_preco_venda decimal(10,2),
    p_unidade char(10)
)
begin
    insert into item
    (idcategoria, item, descricao_item, preco, tipo_item, ativo_produto_servico)
    values
    (p_idcategoria, p_item, p_descricao_item, p_preco,
     p_tipo_item, p_ativo_produto_servico);

    insert into produto
    (idproduto, iditem, codigo_preco, preco_venda, unidade)
    values
    (p_idproduto, last_insert_id(), p_codigo_preco,
     p_preco_venda, p_unidade);
end $$

delimiter ;

-- teste
call pr_cadastrar_produto(
    1,
    'Shampoo',
    'Shampoo para cabelos',
    25.00,
    'P',
    'S',
    'P004',
    1,
    26.00,
    'UN'
);

-- conferindo
select
    p.idproduto, i.item, i.preco, p.codigo_preco, p.preco_venda, p.unidade
from produto p
inner join item i
    on p.iditem = i.iditem;