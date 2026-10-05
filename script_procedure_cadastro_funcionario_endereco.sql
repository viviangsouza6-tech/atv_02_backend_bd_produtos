delimiter $$

create procedure pr_cadastrar_funcionario(
    p_idfuncionario int,
    p_nome varchar(100),
    p_cpf bigint,
    p_data_nascimento date,
    p_sexo char(1),
    p_email varchar(100),
    p_telefone bigint,
    p_ativo_pessoa char(1),
    p_cargo varchar(20),
    p_data_admissao date,
    p_cep char(8),
    p_numero char(10),
    p_complemento varchar(150)
)
begin
    insert into pessoa
    (nome, cpf, data_nascimento, sexo, email, telefone, ativo_pessoa)
    values
    (p_nome, p_cpf, p_data_nascimento, p_sexo, p_email,
     p_telefone, p_ativo_pessoa);

    insert into funcionario
    (idfuncionario, idpessoa, cargo, data_admissao)
    values
    (p_idfuncionario, last_insert_id(), p_cargo, p_data_admissao);

    insert into endereco
    (idpessoa, cep, numero, complemento)
    values
    (last_insert_id(), p_cep, p_numero, p_complemento);
end $$

delimiter ;

-- teste
call pr_cadastrar_funcionario(
    6,
    'Rafael Santos',
    77777777777,
    '1998-04-20',
    'M',
    'rafael@email.com',
    93333333333,
    'S',
    'Atendente',
    '2026-01-10',
    '49006000',
    '700',
    'Casa'
);