create table jogadoresA
(
   nome varchar(50),
   nomeTime varchar(50),
   numeroCamisa integer,
   posicao varchar(50),
   anoRevelacao integer,
   valorMercado number(7,2)
);

select * from jogadoresA;

alter table jogadoresA add RG varchar2(14);

Alter table jogadoresA add constraint RG_PK primary key (RG);

--Inserts--

INSERT INTO jogadoresA VALUES ('Romário','Flamengo', 9, 'Atacante',2011, 52199.99,'11111111111111');
INSERT INTO jogadoresA VALUES ('Pelé','Santos', 9, 'Atacante',1975, 92299.99,'11111111111112');
INSERT INTO jogadoresA VALUES ('Ronaldinho','Flamengo', 9, 'Ponta Esquerda',2008, 99119.99,'11111111111113');
INSERT INTO jogadoresA VALUES ('Rogério Ceni','Sâo Paulo', 1, 'Goleiro',2000, 68199.99,'11111111111114');
INSERT INTO jogadoresA VALUES ('Lúcio','Fluminense', 3, 'Zagueiro',1999, 98799.99,'11111111111115'); 
INSERT INTO jogadoresA VALUES ('Kaká','São Paulo', 8, 'Meia',2009, 64129.99,'1111111111116');
INSERT INTO jogadoresA VALUES ('Marta','Bahia', 10, 'Atacante',2003, 65844.39,'11111111111117');
INSERT INTO jogadoresA VALUES ('Cássio','Corinthians', 1, 'Goleiro',2007, 1199.91,'11111111111118');

select nome as nomes_jogadores
from jogadoresA;

select nome 
from jogadoresA
where posicao = 'Atacante';

select nome 
from jogadoresA
where posicao != 'Atacante' and posicao != 'Goleiro';

select nome, valormercado 
from jogadoresA
where nomeTime = 'São Paulo';

select nome, rg
from jogadoresA
where  numerocamisa != '9';

select *
from jogadoresA
where anorevelacao > 2000;

select nome, nometime, posicao
from jogadoresA
where posicao = 'Atacante' or posicao = 'Meia';

select nome 
from jogadoresA
order by nome;

select nome, numerocamisa
from jogadoresA
order by numerocamisa desc;

select nome, posicao, rg,nometime 
from jogadoresA
where anorevelacao
BETWEEN 2001 and 2005;

select nome 
from jogadoresA
where nome like 'R%';

--  tabela 2 --

create table timeJogadores(
    nome varchar(50) primary key,
    quantTitulos int,
    pais varchar(50),
    serie char(1),
    rg varchar(50),
    foreign key(RG) references jogadoresA(RG)
    
);
select * from timejogadores;
INSERT INTO timejogadores VALUES ('São Paulo',55,'Brasil','A','11111111111114');
INSERT INTO timejogadores VALUES ('São Paulo',55,'Brasil','A','1111111111116');
INSERT INTO timejogadores VALUES ('Flamengo',24,'Brasil','A','11111111111113');
INSERT INTO timejogadores VALUES ('Flamengo',24,'Brasil','A','11111111111111');
INSERT INTO timejogadores VALUES ('Fluminense',46,'Brasil','A','11111111111115');
INSERT INTO timejogadores VALUES ('Bahia',12,'Brasil','B','11111111111117');
INSERT INTO timejogadores VALUES ('Corinthians',34,'Brasil','A','11111111111118');
INSERT INTO timejogadores VALUES ('Santos',49,'Brasil','A','11111111111112');

select a.nome, tj.quanttitulos as quantidades_de_titulos
from jogadoresA a, timeJogadores tj
where tj.rg = a.rg;

select count(nome) as equipes
from timeJogadores;

select avg(a.valormercado)as mediaValorJogadores
from jogadoresA a;

SELECT DISTINCT(nome) as total_times_distintos
FROM timejogadores ;

SELECT c.nome, p.nome
FROM jogadoresa c, timejogadores p
WHERE c.rg = p.rg
ORDER BY c.nome ASC;







