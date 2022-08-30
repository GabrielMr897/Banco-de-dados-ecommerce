create table funcionarios (
	id_codigo serial primary key,
	nome varchar(255) not null,
	cpf varchar(15) not null,
	salario money not null
/* Criando tabela de funcionários */
); 

create table categorias (
	id_codigo serial primary key,
	nome varchar(255) not null
/* Criando tabela de categorias */
);

create table produtos (
	id_codigo serial primary key,
	nome varchar(255) not null,
	quantidade_em_estoque bigint not null,
	data_de_fabricacao date not null,
	data_de_cadastro date not null,
	valor_unitario money not null,
	id_funcionario int,
	id_categorias int,
	foreign key (id_funcionario) references funcionarios(id_codigo),
	foreign key (id_categorias) references categorias(id_codigo)
/* Criando tabela de produtos */
);

create table cliente (
	id_codigo serial primary key,
	nome_completo varchar(255) not null,
	login varchar(80) not null,
	senha varchar(80) not null,
	email varchar(255) not null,
	cpf varchar(15) not null,
	data_de_nascimento date not null,
	telefone_celular varchar(80),
	telefone_fixo varchar(80)
/* Criando tabela de clientes */
);

create table pedidos (
	id_codigo serial primary key,
	data_realizacao timestamp,
	id_cliente int,
	foreign key (id_cliente) references cliente(id_codigo)
/* Criando tabela de pedidos */
);

create table produtos_pedidos (
	id_codigo serial primary key,
	quantidade_de_produtos int,
	id_produtos int,
	id_pedidos int,
	foreign key (id_produtos) references produtos(id_codigo),
	foreign key(id_pedidos) references pedidos(id_codigo)
/* Criando tabela de itens pedidos */
);

create table endereco(
	id_codigo serial primary key,
	id_cliente int,
	foreign key (id_cliente) references cliente(id_codigo),
	uf varchar(2),
	cidade varchar (80),
	cep varchar (80),
	bairro varchar(80),
	rua varchar(80),
	numero varchar(80),
	complemento varchar(255)
/* Criando tabela de endereço */
);

/* Cadastrando funcionarios */
insert into funcionarios(nome, cpf, salario) values ('Pedro Veiga', '15656216', 5000);
insert into funcionarios(nome, cpf, salario) values ('Gabriel Martins', '15895424', 3000);
insert into funcionarios(nome, cpf, salario) values ('Kauan Oliveira', '98953554', 3000);
insert into funcionarios(nome, cpf, salario) values ('Gabriel Cavalcante', '74656154', 3000);
insert into funcionarios(nome, cpf, salario) values ('Gabriel Almeida', '54566566', 3000);
insert into funcionarios(nome, cpf, salario) values ('Davi Coelho', '54566265', 1000);

/* Inserindo categorias */
insert into categorias (nome) values ('Calca');
insert into categorias (nome) values ('Camiseta');
insert into categorias (nome) values ('Casacos e jaquetas');
insert into categorias (nome) values ('Camisa');
insert into categorias (nome) values ('Tenis');
insert into categorias (nome) values ('Roupa intima');
insert into categorias (nome) values ('bone');
insert into categorias (nome) values ('meias');
insert into categorias (nome) values ('Camisas polo');

/* Inserindo produtos */
insert into produtos(nome, quantidade_em_estoque, data_de_fabricacao, data_de_cadastro, valor_unitario, id_funcionario, id_categorias) values('Calça jeans', 35, '20-05-2017', '28-06-2017', 200, 2, 1);
insert into produtos(nome, quantidade_em_estoque, data_de_fabricacao, data_de_cadastro, valor_unitario, id_funcionario, id_categorias) values('Camisa polo Lacoste', 80, '21-07-2017', '05-08-2017', 70, 4, 9);
insert into produtos(nome, quantidade_em_estoque, data_de_fabricacao, data_de_cadastro, valor_unitario, id_funcionario, id_categorias) values('Casaco moletom Nike', 70, '23-03-2019', '20-04-2019', 100, 2, 3);
insert into produtos(nome, quantidade_em_estoque, data_de_fabricacao, data_de_cadastro, valor_unitario, id_funcionario, id_categorias) values('Tenis Adidas', 60, '25-11-2021', '15-02-2022', 180, 2, 5);
insert into produtos(nome, quantidade_em_estoque, data_de_fabricacao, data_de_cadastro, valor_unitario, id_funcionario, id_categorias) values('Bone adidas', 40, '18-05-2017', '28-06-2022', 90, 2, 7);

/* Cadastrando cliente */
insert into cliente (nome_completo, login, senha, email, cpf, data_de_nascimento, telefone_celular, telefone_fixo) 
values
	('Adriano da Silva', 'adriano123', '1234569867','adriano@gmail.com','123.456.789-10','12/01/1980','(21)98859-6985', '2742-6855'),
	('Lucas Oliveira', 'lucas123', '123435345','lucas@gmail.com','122.455.789-11','30/05/1988', '(21)99244-9150', '2642-3811'),
	('Leonardo Castro', 'leocastro123', '123423456','leocastro@gmail.com','124.556.989-21','25/01/2000','(21)97405-6835','2712-3389'),
	('Rodrigo Alves', 'rodrigo123', '1232344567','rodrigoalves@gmail.com','923.786.599-01','15/11/1992', '(21)98695-7485','2493-6883'),
	('Andrei Gomes', 'andrei123', '12345678','andreigomes@gmail.com','145.928.177-09','03/10/1990','(21)99673-5423','2591-0081');

/* clientes com o email ou senha fora do padrão (para posterior exclusão) */
insert into cliente (nome_completo, login, senha, email, cpf, data_de_nascimento, telefone_celular, telefone_fixo) 
values
	('Rafael Peixoto', 'rafael123', '1234','rafael@gmail.com','124.486.789-10','12/01/1980','(21)98859-6985', '2742-6855'),
	('Giovana Brahim', 'giovana123', '12345678','giovanagmail.com','112.435.769-11','30/05/1988', '(21)99244-9150', '2642-3811');

/* inserindo pedidos */
insert into pedidos(data_realizacao, id_cliente)
values
	(current_timestamp, 3),
	(current_timestamp, 3),
	(current_timestamp, 4),
	(current_timestamp, 1),
	(current_timestamp, 2),
	(current_timestamp, 4),
	(current_timestamp, 5);
	

/* inserindo produtos pedidos */
insert into produtos_pedidos(quantidade_de_produtos, id_produtos, id_pedidos)
values
	(2, 2, 1),
	(2, 2, 7),
	(1, 1, 1),
	(1, 5, 2),
	(1, 3, 2),
	(2, 4, 3),
	(1, 3, 4),
	(1, 1, 6),
	(1, 1, 5);
	

/* inserindo endereço */
insert into endereco(id_cliente, uf, cidade, cep, bairro, rua, numero, complemento) 
values
	(1, 'RJ', 'Rio de Janeiro', '22240006', 'Laranjeiras', 'Rua das Laranjeiras', '462', 'apartamento 901'),
	(2, 'RJ', 'Teresópolis', '25965176', 'Barra do imbuí', 'Rua Doutor Oliveira', '441', 'apartamento 201'),
	(3, 'RJ', 'Nova Friburgo', '26242876', 'Campo do Coelho', 'Rua das Noivas', '143', 'apartamento 103'),
	(4, 'SP', 'São Bernardo do Campo', '21653327', 'Paulicéia', 'Rua Seis', '38', 'apartamento 502'),
	(5, 'RJ', 'Petrópolis', '24847326', 'Retiro', 'Rua Fernandes Vieira', '46', 'Em frente à Padaria e Confeitaria Sul América');


/* Consultando nome dos produtos cadastrados, nome das categorias de cada produto, nome de cada funcionário que cadastrou o produto */
select
produtos.nome as nome_produtos, funcionarios.nome as nome_funcionarios , categorias.nome as nome_categorias 
from 
produtos  
inner join 
categorias 
on 
produtos.id_categorias = categorias.id_codigo 
inner join 
funcionarios 
on
produtos.id_funcionario = funcionarios.id_codigo
order by 
nome_produtos

	
/* Consultando os pedidos feitos, com o nome do cliente e seus respectivos telefones */
select 
pedidos.id_codigo as id_pedido , cliente.nome_completo as nome_cliente, cliente.telefone_celular, cliente.telefone_fixo 
from 
pedidos 
inner join 
cliente 
on 
pedidos.id_cliente = cliente.id_codigo 
order by 
cliente.nome_completo


/* Consultando todos os pedidos feitos, mostrando seus itens, número do pedido, nome do cliente, 
   data do pedido, nome do produto comprado e quantidade de cada produto */
select 
produtos_pedidos.id_pedidos, produtos.nome as nome_produtos, cliente.nome_completo, 
pedidos.data_realizacao, produtos_pedidos.quantidade_de_produtos 
from 
produtos_pedidos 
inner join 
pedidos 
on 
produtos_pedidos.id_pedidos = pedidos.id_codigo 
inner join 
produtos 
on 
produtos_pedidos.id_produtos = produtos.id_codigo 
inner join 
cliente 
on 
cliente.id_codigo = pedidos.id_cliente  


/* Consultando a quantidade de pedidos por cliente, com resultado ordenado pelo nome do cliente */
select
cliente.nome_completo, count(pedidos.id_codigo) as quantidade_de_pedidos
from 
pedidos
inner join
cliente
on
pedidos.id_cliente = cliente.id_codigo
group by cliente.nome_completo 
order by cliente.nome_completo 

/*atualizando o salário dos funcionários */
update funcionarios 
set salario = (salario + '500');

/* atualização do email de um cliente */
update cliente set email = 'lucas.oliveira@gmail.com'
where id_codigo = 2

/* atualização do telefone celular de um cliente */
update cliente set telefone_celular = '(21)97546-4738'
where id_codigo = 2

/*atualização do telefone fixo de um cliente */
update cliente set telefone_fixo = '2753-1108'
where id_codigo = 2

/*Exclusão de um cliente */
delete from cliente 
      where email not like '%@%'
      or length (senha)<8;