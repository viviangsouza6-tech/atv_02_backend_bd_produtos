create view vw_funcionarios_enderecos as
select
    f.idfuncionario, p.idpessoa, p.nome, e.idendereco, e.cep, e.numero, e.complemento
from funcionario f
join pessoa p
    on f.idpessoa = p.idpessoa
join endereco e
    on e.idpessoa = p.idpessoa;
    
select * from vw_funcionarios_enderecos;

