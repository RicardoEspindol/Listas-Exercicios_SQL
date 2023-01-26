
create table partido(
    sigla varchar(2),
    nome varchar(70),
    primary key(sigla)
)
create table candidato(
    cpf varchar(11),
    nome varchar(70),
    cidade varchar(70),
    estado varchar(50),
    idade int,
    sexo char,
    sigla varchar(50),
    primary key(cpf),
    foreign key(sigla) references partido(sigla)
)

create table cargo(
    id_cargo int,
    nome varchar(50),
    primary key(id_cargo)
)

create TABLE candidatura(
cpf varchar(11),
    id_cargo int,
    ano int,
    primary key(ano),
    foreign key(cpf)references candidato(cpf),
    foreign key(id_cargo)references cargo(id_cargo)
)

create table candidatoEleito(
    cpf varchar(11),
    ano int,
    numero_votos decimal,
    primary key(ano),
    foreign key(cpf)references candidato(cpf)
)

insert into partido values ('pt', 'Partido Trabalhista');
insert into partido values ('pp', 'Progressistas');
insert into partido values ('pv', 'Partido Verde');
insert into partido values ('dc', 'Democracia Cristão');
insert into partido values ('pl','Partido Liberal');
insert into partido values ('up', 'Unidade Popular');

insert into candidato values ('0000','José Robson','Pesqueira','pe',54,'m','pt');
insert into candidato values('1111','Ronaldo Magalhães','José Pessoa','pb',38,'m','pp');
insert into candidato values('2222','Livia Souza','Natal','rn',22,'f','pl');
insert into candidato values('3333','Carmelita Mergulhão','Recife','pe',43,'f','up');
insert into candidato values('4444','Neto Junior','São Paulo','sp',66,'m','pv');
insert into candidato values('5555','Priscila Abraão','Rio de Janeiro','rj',61,'f','pv');
insert into candidato values('6666','Gabriel Silva','Maceio','al',24,'m','pt');
insert into candidato values('7777','Leticia Macedo','Teresina','pi',51,'f','dc');
insert into candidato values('8888','Caio lima','Patos','pb',75,'m','pt');
insert into candidato values('9999','Maria Catarina','Goiania','go',68,'f','pp');
select * from candidato;

insert into cargo values(415, 'Governador');
insert into cargo values(416,'Deputado Estadual');
insert into cargo values(419,'Deputado Federal');
insert into cargo values(427, 'Senador');
insert into cargo values(433,'Presidente');

insert into candidatura values ('0000',416,2020);
insert into candidatura values ('1111',416,2023);
insert into candidatura values ('2222',419,2012);
insert into candidatura values ('3333',427,2018);
insert into candidatura values ('4444',433,2022);
insert into candidatura values ('5555',433,2028);
insert into candidatura values ('6666',415,2027);
insert into candidatura values ('7777',419,2026);
insert into candidatura values ('8888',416,2015);
insert into candidatura values ('9999',415,2019);
	
insert into candidatoeleito values('0000',2020, 45126);
insert into candidatoeleito values('1111',2023,5126);
insert into candidatoeleito values('2222',2012,65486);
insert into candidatoeleito values('3333',2018,12496);
insert into candidatoeleito values('4444',2022,6542);
insert into candidatoeleito values('5555',2028,34588);
insert into candidatoeleito values('6666',2027,988460);
insert into candidatoeleito values('7777',2026,2455);
insert into candidatoeleito values('8888',2015,111126);
insert into candidatoeleito values('9999',2019,4124);
	select * from candidatoeleito;


select count(sexo), sexo as quantBySexo
from candidato
group by sexo;

select count(sexo), sexo as maiorQ3
from candidato 
group by sexo
having count(sexo) > 3;

select max(idade), estado 
from candidato
group by estado;

select min(idade), estado 
from candidato
group by estado;

select min(idade)
from candidato
where idade < 26;

select min(numero_votos) as menorVotacao2020
from candidatoeleito
where ano = 2020;

select count(distinct(cidade)) as quantCityDistinct
from candidato;

select nome
from cargo
order by nome asc; 

select c.nome, p.sigla 
from candidato c, partido p
where c.sigla = p.sigla
order by c.nome asc;

/*

14. Listar o nome do candidato eleito com maior número de votos, e qual foi sua
votação

15. Listar os candidatos que não são do Sudeste

*/
select c.nome, cg.nome, ct.ano
from candidato c, cargo cg, candidatura ct
where cg.id_cargo = ct.id_cargo and c.cpf = ct.cpf;

select c.nome, cg.nome, ct.ano
from candidato c, cargo cg, candidatura ct
where cg.id_cargo = ct.id_cargo and c.cpf = ct.cpf
order by cg.nome, c.nome asc;

select c.nome, c.idade, c.cidade, c.sigla, ct.ano
from candidato c, candidatura ct, cargo cg
where c.cpf = ct.cpf and ct.id_cargo = cg.id_cargo and ct.ano = 2020;

select c.nome, cce.ano
from candidato c, candidatoeleito cce, candidatura ctt
where cce.ano = ctt.ano and cce.ano = 2020 and c.cpf = ctt.cpf;

select c.nome, cet.numero_votos
from candidatoeleito cet, candidato c
where c.cpf = cet.cpf and cet.numero_votos = (select  max(cet.numero_votos) from candidatoeleito cet);

select * from candidato
where estado not in('sp','rj','es','mg');
