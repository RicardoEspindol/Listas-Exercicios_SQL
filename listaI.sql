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

insert into filmes values(1,1, 'Homem Aranha', 2020,3200000.50);
insert into filmes values(2,3, 'Lendas da Paixão', 2018,500000.80);
insert into filmes values(3,2, 'Drácula', 2005,150000.00);
insert into filmes values(4,2, 'O Porão', 2021,100000.90);
insert into filmes values(5,4, 'Os outros', 2016,60000.70);
insert into filmes values(6,1, 'Adrenalina', 2020,340000.00);
select * from filmes;


insert into generos values(1, 'Aventura');
insert into generos values(2, 'Terror');
insert into generos values(3, 'Romance');
insert into generos values(4, 'Suspense');
insert into generos values(5, 'Comédia');
select * from generos;

/*
k) Utilizando junção de tabelas, listar os nomes dos filmes, e seus respectivos gêneros
l) Utilizando junção de tabelas, listar os nomes dos filmes de Terror*/


select * from filmes order by ds_titulo asc;

select * from filmes order by nm_arrecadacao desc;

select DISTINCT(nm_ano_lancamento) from filmes;

select max(nm_arrecadacao) as maiorArrecadacao from filmes;

select min(nm_arrecadacao) as menorArrecadacao from filmes where cd_gen = 1;

select avg(nm_arrecadacao) as mediaTerror from filmes where cd_gen = 2;

select count(cd_gen) as totalAventura from filmes where cd_gen = 1;

select ds_titulo as maiorArrecadacao from filmes where nm_arrecadacao = (select max(nm_arrecadacao) from filmes);

select ds_titulo as maisRecente from filmes where nm_ano_lancamento = (select max(nm_ano_lancamento) from filmes);

select f.ds_titulo, g.cd_gen, g.ds_gen from filmes f, generos g where f.cd_gen = g.cd_gen;

select f.ds_titulo, g.ds_gen from filmes f, generos g where f.cd_gen = g.cd_gen and f.cd_gen = 2;

