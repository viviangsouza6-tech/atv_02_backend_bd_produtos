create view vw_atendimentos as
select
    a.idatendimento, cliente.nome as cliente, i.item, ai.quantidade_itens, ai.valorunitario_entrada, funcionario.nome as funcionario
from atendimento a

inner join pessoa cliente
    on a.idpessoa = cliente.idpessoa

inner join atendimentoitem ai
    on a.idatendimento = ai.atendimento_idatendimento

inner join item i
    on ai.item_iditem = i.iditem

inner join funcionario f
    on ai.idfuncionario = f.idfuncionario

inner join pessoa funcionario
    on f.idpessoa = funcionario.idpessoa;
    
select * from vw_atendimentos;