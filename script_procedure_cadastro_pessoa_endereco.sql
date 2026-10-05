delimiter $$

create procedure pr_cadastrar_pessoa_endereco(
    p_nome varchar(100),
    p_cpf bigint,
    p_data_nascimento date,
    p_sexo char(1),
    p_email varchar(100),
    p_telefone bigint,
    p_ativo_pessoa char(1),
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

    insert into endereco
    (idpessoa, cep, numero, complemento)
    values
    (last_insert_id(), p_cep, p_numero, p_complemento);
end $$

delimiter ;


-- testee
call pr_cadastrar_pessoa_endereco(
    'Lucas Ferreira',
    66666666666,
    '2001-09-15',
    'M',
    'lucas@email.com',
    94444444444,
    'S',
    '49005000',
    '600',
    'Casa'
);