-- Database: dataBaseII

-- DROP DATABASE IF EXISTS "dataBaseII";

CREATE DATABASE "dataBaseII"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	create table filmes(
	cd_filme int,
	cd_gen integer,
	ds_titulo varchar(70),
	nm_ano_lancamento int,
	nm_arrecadacao numeric(10,2),
	primary key(cd_filme),
	FOREIGN key(cd_gen)REFERENCES generos(cd_gen)
)

create table generos(
	cd_gen integer,
	ds_gen varchar(70),
	primary key(cd_gen)
)

insert into filmes(cd_filme, cd_gen, ds_titulo,nm_ano_lancamento,nm_arrecadacao ) 
values(1,1, 'Homem Aranha', 2020,3200000.50),
(2,3, 'Lendas da Paixão', 2018,500000.80),
(3,2, 'Drácula', 2005,150000.00),
(4,2, 'O Porão', 2021,100000.90),
(5,4, 'Os outros', 2016,60000.70),
(6,1, 'Adrenalina', 2020,340000.00)
select * from filmes;


insert into generos(cd_gen, ds_gen) values(1, 'Aventura'),(2, 'Terror'),(3, 'Romance'),(4, 'Suspense'),(5, 'Comédia')
select * from generos;

-- selects ---

-- letra b ---
select ds_titulo
from filmes
order by ds_titulo asc;

-- letra c ---
select ds_titulo as arrecadacao_decrescente
from filmes
order by nm_arrecadacao desc;

-- letra d --
select  distinct nm_ano_lancamento as ano_lancamento_distinto
from filmes ;

-- letra e --
SELECT max(nm_arrecadacao) as maior_arrecadação
from filmes;

-- letra f--
select min(nm_arrecadacao) as menor_arrecadacao_aventura
from filmes
where cd_gen = 1;

-- letra g --
select avg(nm_arrecadacao) as media_terror
from filmes
where cd_gen = 2;

-- letra h --
select count (cd_gen) as filmes_aventura
from filmes
where cd_gen = 1;

-- letra i --
select ds_titulo as maior_bilheteria
from filmes
where nm_arrecadacao = (select max(nm_arrecadacao) from filmes);

-- letra j --
select ds_titulo as filme_recente
from filmes
where nm_ano_lancamento= (select max(nm_ano_lancamento) from filmes);

-- letra k --
select f.ds_titulo, ge.ds_gen as filme_generos
from filmes f, generos ge
where f.cd_gen = ge.cd_gen;

-- letra l--
select ds_titulo as filmes_terror
from filmes
where cd_gen = 2;




