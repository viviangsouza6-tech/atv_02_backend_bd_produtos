delimiter $$

create procedure pr_cadastrar_atendimento(
    p_idpessoa int,
    p_data_atendimento date,
    p_status_atendimento char(1)
)
begin
    insert into atendimento
    (idpessoa, data_atendimento, status_atendimento)
    values
    (p_idpessoa, p_data_atendimento, p_status_atendimento);
end $$

delimiter ;

-- teste
call pr_cadastrar_atendimento(
    5,
    '2026-10-16',
    'A'
);

select * from atendimento;