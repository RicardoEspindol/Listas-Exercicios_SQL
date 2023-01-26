-- Database: postgres

-- DROP DATABASE IF EXISTS postgres;

CREATE DATABASE postgres
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


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
		numero_votos bigint,
		primary key(ano),
		foreign key(cpf)references candidato(cpf)
	)
	
	
insert into partido(sigla, nome) values ('pt', 'Partido Trabalhista'),
('pp', 'Progressistas'), ('pv', 'Partido Verde'),('dc', 'Democracia Cristã'),
('pl','Partido Liberal'),('up', 'Unidade Popular')

insert into candidato(cpf,nome, cidade,estado,idade,sexo,sigla) values ('0000','José Robson','Pesqueira','pe',54,'m','pt'),
('1111','Ronaldo Magalhães','João Pessoa','pb',38,'m','pp'),('2222','Livia Souza','Natal','rn',22,'f','pl'),
('3333','Carmelita Mergulhão','Recife','pe',43,'f','up'),('4444','Neto Junior','São Paulo','sp',66,'m','pv'),
('5555','Priscila Abraão','Rio de Janeiro','rj',61,'f','pv'),('6666','GAbriel Silva','Maceio','al',24,'m','pt'),
('7777','Leticia Macedo','Teresina','pi',51,'f','dc'),('8888','Caio lima','Patos','pb',75,'m','pt'),
('9999','Maria Catarina','Goiania','go',68,'f','pp')
select * from candidato

insert into cargo(id_cargo, nome)values(415, 'Governador'),(416,'Deputado Estadual'),(419,'Deputado Federal'),
(427, 'Senador'),(433,'Presidente')

insert into candidatura(cpf,id_cargo, ano) values ('0000',416,2020),('1111',416,2023),('2222',419,2012),('3333',427,2018),
('4444',433,2022),('5555',433,2028),('6666',415,2027),('7777',419,2026),('8888',416,2015),('9999',415,2019)
	
insert into candidatoeleito(cpf, ano, numero_votos) values('0000',2020, 45126), ('1111',2023,5126),('2222',2012,65486),('3333',2018,12496),
('4444',2022,6542),('5555',2028,34588),('6666',2027,988460),('7777',2026,2455),('8888',2015,111126),('9999',2019,4124)
	select * from candidatoeleito
	
	
-- SELECTS --
-- QUESTÃO 1 --
SELECT sexo, COUNT(sexo)
FROM candidato 
GROUP BY sexo;

-- QUESTÃO 2 --
SELECT sexo, COUNT(sexo)
FROM candidato 
GROUP BY sexo
HAVING COUNT(sexo) > 3;

-- QUESTÃO 3 --
SELECT estado, MAX(idade)
FROM candidato 
GROUP BY estado;

-- QUESTÃO 4 --
SELECT estado, MIN(idade)
FROM candidato
GROUP BY estado;

-- QUESTÃO 5 --
SELECT estado, MIN(idade)
FROM candidato 
GROUP BY estado
HAVING MIN(idade) < 26;

-- QUESTÃO 6 --
SELECT MIN(numero_votos)
FROM candidatoEleito; --------------------------
-- QUESTÃO 7 --
SELECT DISTINCT count(cidade) as total_cidades_distintas
FROM candidato ;


-- QUESTÃO 8 --
SELECT nome as cargos_ordenados
FROM cargo 
ORDER BY nome ASC;


-- QUESTÃO 9 --
SELECT c.nome, p.nome
FROM candidato c, partido p
WHERE c.sigla = p.sigla
ORDER BY c.nome ASC;

-- QUESTÃO 10 --
SELECT c.nome, cg.nome, cdd.ano
FROM candidato c, candidatura cdd, cargo cg
WHERE c.cpf = cdd.cpf
AND cdd.id_cargo = cg.id_cargo;


-- QUESTÃO 11 --
SELECT c.nome, cg.nome, cdd.ano
FROM candidato c, candidatura cdd, cargo cg
WHERE c.cpf = cdd.cpf
AND cdd.id_cargo = cg.id_cargo
ORDER BY cg.nome, c.nome ASC;


-- QUESTÃO 12 --
SELECT c.nome, c.idade, c.cidade, c.sigla, cg.nome
FROM candidato c,candidatura cdd, cargo cg
WHERE c.cpf = cdd.cpf
AND cg.id_cargo = cdd.id_cargo AND cdd.ano = 2020;

-- QUESTÃO 13 --
SELECT c.nome, ce.numero_votos
FROM candidato c, candidatoEleito ce
WHERE c.cpf = ce.cpf
AND ce.ano = 2020;

-- QUESTÃO 14 --
SELECT c.nome, ce.numero_votos
FROM candidato c, candidatoEleito ce
WHERE c.cpf = ce.cpf
AND ce.numero_votos = (SELECT MAX(ce.numero_votos) FROM candidatoEleito ce);

-- QUESTÃO 15 --
SELECT * 
FROM candidato c
WHERE c.estado NOT IN('sp','rj','es','mg');
