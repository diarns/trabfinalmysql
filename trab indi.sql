use trab_individual;

create table caixa (
prim_key int primary key,
data date not null,
operacao varchar (20) not null,
funcionario varchar (50) not null,
produto nvarchar (50) not null,
fornecedor nvarchar (80),
cliente varchar (60),
quantidade int not null,
valor double not null
);

create table custos (
Pk int primary key,
tipo2  char(20) not null ,
tipo char(20) not null ,
empresa varchar (100) not null ,
valor double not null,
date date not null
);



create table fornecedores (
pk int primary key,
nome varchar (100) not null,
cnpj nvarchar (20) not null,
contato varchar(30) not null
);
create table inventario (
pk int primary key,
nome_referencia varchar (50),
local varchar (50),
valor double not null
);

create table estoque (
pk int primary key,
produto Varchar (50) not null,
fornecedor nvarchar(100) not null,
grupo_afinidade nvarchar (50) not null,
qtde_estoque int (100),
valor_custo double not null,
valor_venda double not null
);
-- alter table cliente  ADD column pk2 primary key  int (1) ;

alter table cliente  ADD PRIMARY KEY(pk);
select *from estoque; 
-- 6

select caixa.*, funcionarios.* from caixa left join funcionarios on caixa.prim_key = funcionarios.pk
where funcionarios.pk = '';
select caixa.*, fornecedores.* from caixa inner join fornecedores on fornecedores.pk = caixa.pk;
SELECT caixa.*, custos.* FROM caixa RIGHT JOIN custos ON caixa.prim_key = custos.pk;
SELECT estoque.*, inventario.* FROM estoque RIGHT JOIN inventario ON estoque.pk = inventario.pk;
SELECT estoque.*, inventario.* FROM estoque left JOIN inventario ON estoque.pk = inventario.pk;

-- 7

select * from caixa
order by operacao;

select * from caixa
order by cliente;

select * from fornecedores
order by cnpj;

select * from estoque
order by fornecedor;

select * from inventario
order by pk;

-- 8

select operacao, funcionario
from caixa
group by funcionario;

select funcionario, produto
from caixa
group by produto;

select local, valor
from inventario
group by local;

select grupo_afinidade, qtde_estoque
from estoque
group by grupo_afinidade;

select fornecedor, valor_venda
from estoque
group by fornecedor;

-- 9

select fornecedor.*, qtde_estoque.pk from estoque
right outer join caixa on estoque.pk = caixa.prim_key
where qtde_estoque >= 0 
order by produto;

select funcionario.*, produto.* from caixa
full join caixa on estoque.pk = caixa.prim_key
where estoque = 0 
order by fornecedor;

select empresa.*, valor.* from custos 
left outer join valor on custos.pk = estoque.pk
where custos between '1' and '200'
order by produtos;

 -- 10 
 
 select max(valor) as max
 from caixa;
 
 select sum(valor) as sum
 from caixa;
 
 select min(valor) as min
 from caixa;
 
 select avg(valor) as average
 from caixa;
 
-- 11

create view mes
as select * from caixa;

create view produto
as select * from caixa;

create view funcionario_manha
as select * from funcionarios;

create view fornecedor_mes
as select * from caixa;

create view cliente_prod
as select * from caixa;

-- 12 

start transaction;
insert into inventario values(16, "mesa","rua","50");
savepoint savepoint1;

insert into inventario values(17,"bituqueira","rua","20");
savepoint savepoint2;

insert into inventario values(18,"extintor","rua","180");
savepoint savepoint3;

insert into inventario values(18,"tapete","rua","250");
savepoint savepoint4;

insert into inventario values(19,"placa","rua","100");
savepoint savepoint5;

-- 13 

create user diogo1@localhost
identified by '1';

create user diogo2@localhost
identified by '2';

create user diogo3@localhost
identified by '3';

grant all on trab_individual.caixa to 'diogo1@localhost';

grant insert on trab_individual.caixa to 'diogo2@localhost';

grant select on trab_individual.caixa to 'diogo3@localhost';

