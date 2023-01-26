create table produto(
    codigo varchar(5) primary key,
    nome varchar(20),
    marca varchar(20),
    preco  number(7,2),
    quantidade int
)

create table curso(
    codigo varchar(5) primary key,
    nome varchar(20),
    valor number(7,2),
    codInstrutor varchar(5),
    foreign key(codInstrutor) references instrutor(codigo)
)

create table instrutor(
    codigo varchar(5) primary key,
    nome varchar(20),
    telefone char(9),
    email varchar(35)
)
select * from produto;
select * from curso;
select * from instrutor;

insert into produto values('12345','Cg 160 Fan', 'Honda', 15999.99, 32);
insert into produto values('23456','RD 350', 'Yamaha', 24999.99, 13);
insert into produto values('34567','Sportster Iron 883', 'Harley', 28000.90, 25);
insert into produto values('45678','T500', 'Suzuki', 9982.99, 4);
insert into produto values('56789','Adventure', 'Kawasaki', 15999.59, 60);
insert into produto values('67890','G 310 R', 'BMW ', 46579.99, 22);
insert into produto values('78910','Meteor 350', 'Royal Enfield', 15999.99, 32);

insert into curso values('99991', 'Engenharia',564.99 , '11111');
insert into curso values('99992', 'Pedagogia', 999.99, '55555');
insert into curso values('99993', 'Administração', 239.90 , '33333');
insert into curso values('99994', 'Logística', 1500.00 , '22222');
insert into curso values('99995', 'Medicina', 768.39 , '44444');


insert into instrutor values ('11111', 'Robson', '981284419', 'robsonkk@gmail.com');
insert into instrutor values ('22222', 'Eduardo', '981784629', 'dudusouza@gmail.com');
insert into instrutor values ('33333', 'Evandro', '981243915', 'evandrolima@gmail.com');
insert into instrutor values ('44444', 'Kaio', '981652879', 'kaiozinho33@gmail.com');
insert into instrutor values ('55555', 'Felipe', '981568749', 'andrefelipe@gmail.com');
insert into instrutor values ('6666', 'Messias', '981568759', '');

-- FUNÇÕES EM ORACLE 

--UPPER
select nome ,upper(nome) as "Curso Maiúsculo"
from curso ;

--LOWER
select nome ,lower(nome) as "Nome Instrutor Minúsculo"
from instrutor ;

--INITCAP
select email ,initcap(email) as "Email Initcap"
from instrutor ;

--LENGTH
select telefone ,length(telefone) as "Tamanho Telefone"
from instrutor ;

--CONCAT
select concat(nome, concat(' tem seu numero de telefone igual a ', telefone)) "Numeros telefones"
from instrutor;

--ROUND 
select preco, round(preco,1) "Preço com 1 casa decimal"
from produto;

--POWER  
select quantidade, power(quantidade,3) "Elevado ao Cubo"
from produto;

--SQTR
select quantidade ,sqrt(quantidade) "Raiz Quadrada de Quantidade"
from produto;

--CEIL
select preco, ceil(preco) "Preço Arredondado Pra Cima"
from produto;

--FLOOR
select preco, floor(preco) "Preço Arredondado Pra Baixo"
from produto;

--SYSDATE
select sysdate "Data Atual"
from dual;

--CURRENT_DATE
select current_date "Data Corrente"
from dual;

--NEXT_DAY
select next_day('30/09/2022', 'sexta') "Proxima Sexta"
from dual;

--NVL
select email, nvl(email, 'Sem email') "Telefone"
from instrutor;



