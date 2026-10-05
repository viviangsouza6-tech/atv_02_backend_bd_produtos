create view vw_clientes_enderecos as
select
	p.idpessoa, p.nome, e.idendereco, e.cep, e.numero, e.complemento
from pessoa p
inner join endereco e
    on e.idpessoa = p.idpessoa;
    
select * from vw_clientes_enderecos;