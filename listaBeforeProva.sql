create table professor(
    matricula number(5) primary key,
    nome varchar(70) not null,
    sexo char(1),
    estado char(2),
    cidade varchar2(40),
    whatsapp varchar2(15),
    data_admissao date default sysdate,
    idade number(3),
    salario number(7,2)
)

create sequence matriculaP_seq
    start with 550
    increment by 50;
    
select * from professor;

insert into professor values(MATRICULAP_SEQ.nextval, 'Carlos Magalhães','m','pe','Belo Jardim','87981269875',sysdate,48,6244.65);
insert into professor values(MATRICULAP_SEQ.nextval, 'Maria Aparecida','f','sp','Guarulhos','79954641889',TO_DATE('19/07/2017'),24,2546.38);
insert into professor values(MATRICULAP_SEQ.nextval, 'Claudio Silva','m','pb','Monteiro','81985427613',TO_DATE('12/11/2020'),53,9542.47);
insert into professor values(MATRICULAP_SEQ.nextval, 'Iraquitan José','m','pb','Umbuzeiro','81983349975',TO_DATE('11/06/2018'),28,1587.65);
insert into professor values(MATRICULAP_SEQ.nextval, 'Sabrina Correia','f','pe','Belo Jardim','86996548216',TO_DATE('29/07/2020'),22,4875.31);
insert into professor values(MATRICULAP_SEQ.nextval, 'Yasmin de Oliveira','f','pe','Belo Jardim','81988741286',TO_DATE('04/04/2018'),39,2981.61);
insert into professor values(MATRICULAP_SEQ.nextval, 'Carmelita Silva','f','rn','Natal','87965478935',TO_DATE('19/03/2017'),38,6458.22);
insert into professor values(MATRICULAP_SEQ.nextval, 'Severino Lopes','m','ce','Crato','81961488496',TO_DATE('30/09/2020'),51,1852.99);

-- Questão 1

/* Criar uma view que exiba em ordem alfabética os professores com salário
acima da média, e cujo whatsapp não seja do DDD 81 */
create view vQuestao1 as
select nome, salario, whatsapp
from professor 
where salario > (select avg(salario) from professor) and whatsapp not like '81%'
order by nome;

/* Código sql para visualizar a view acima */
select * from vQuestao1; 

/* Código SQL para remover a view acima */
drop view vQuestao1;

-- Questão 2

/* Criar uma view que exiba a maior idade dos professores por estado */
create view vMaiorIdadeByEst as
select estado, max(idade) as maiorIdadeByEstado
from professor
group by estado;

/* Código sql para visualizar a view acima */
select * from vMaioridadebyest;


--Questão 3

/* Exibir os professores com idade entre a menor idade e 35, em ordem
crescente de idade */
select nome, idade
from professor
where idade BETWEEN (select min(idade) from professor) and 35
order by idade asc;


--Questão 4

/* Atualizar o salário do professor com a maior idade para que tenha também o
maior salário */

update professor 
set salario = 10000.00
where idade = (select max(idade) from professor);

--Questão 5 

/* Mostrar os professores em ordem alfabética, bem como os seus salários
arredondados com apenas uma casa decimal. Outrossim, na exibição desta
consulta, dever-se-á converter o nome do professor, de forma que o primeiro
caractere de cada palavra esteja em maiúscula, e o restante em minúscula */

select initcap(nome), round(salario,1)
from professor
order by nome;

--Questão 6

/* Mostrar os professores, e suas respectivas datas de admissão, mas apenas
dos docentes cujo ano de admissão é diferente de 2020 */

select nome, salario, data_admissao
from professor
where extract(year from data_admissao) = 2020;

--Questão 7

/* Criar as tabelas academia (codigo, nome) e instrutor (codigo, nome, salario,
idade, cidade, estado, graduacao, codigo_academia) de modo que as Restrições
de Domínio (envolvendo os campos salario, idade e graduação), de Chave, de
Entidade, e de Integridade Referencial sejam respeitadas. */

create table academia(
    codigo int not null primary key,
    nome varchar(30)
)

create table instrutor_acad(
    codigo int primary key not null,
    nome varchar(30),
    salario number(7,2),
        check (salario between 300 and 9000), 
    idade int,
        check(idade between 20 and 65),
    cidade varchar(30),
    estado char(2),
    graduacao varchar(30),
        check(graduacao in ('educacao fisica', 'fisioterapia', 'nutricao')),
    codigo_academia int,
    foreign key (codigo_academia) references academia(codigo)
);

/* Testar cada Restrição de Integridade indicada acima*/
insert into academia values(555, 'Styllus');
insert into academia values(666, 'Muscle10');
insert into academia values(555, 'MachoMan'); --Restrição de Chave
insert into academia values(null, 'Corpus'); --Restrição de Vazio

insert into instrutor_acad values(12, 'Márcio Laerte', 2521.69, 27, 'Belo Jardim', 'pe', 'educacao fisica', 555);
insert into instrutor_acad values(23, 'Luiz Felipe', 6421.29, 34, 'Pesqueira', 'pe', 'nutricao', 666);
insert into instrutor_acad values(null, 'Márcio Laerte', 2521.69, 27, 'Belo Jardim', 'pe', 'educacao fisica', 555);--Restição de vazio
insert into instrutor_acad values(34, 'Kaio Marques', 9478.54, 61, 'Sanharó', 'pe', 'fisioterapia', 555);--Restrição de dominio
insert into instrutor_acad values(45, 'João Marques', 1738.54, 31, 'Sanharó', 'pe', 'nutricao', 777); --Restrição referencial
insert into instrutor_acad values(56, 'Marcos Laerte', 4623.69, 27, 'Belo Jardim', 'pe', 'economia', 555); --Restrição de domínio
insert into instrutor_acad values(12, 'Marina Costa', 6311.88, 37, 'Sao Bento do Una', 'pe', 'educacao fisica', 666); --Restição de chave

delete from academia where codigo = 555; --Restrição referencial 

select * from instrutor_acad;

--Questão 8

/* Criar uma function que retorne o valor em euro de forma arredondada em duas
casas decimais, dada a cotação do euro e o valor em reais */

create or replace function euro(valorRS in number)
return number
is 
    begin 
        return (valorRS / 5.09);
    end;
    
/* Visualizar o resultado da aplicação da função anterior */
select euro(50) from dual;

--Questão 9

/* Criar uma procedure para aumentar o salário dos professores, dado um
percentual de aumento */

create or replace procedure aumentarSalarioP(percentual in number)
is 
    begin
        update professor set salario = salario * (1 + (percentual / 100));
    end;
    
/* Executar a procedure anterior*/
EXEC aumentarsalariop(16);
select * from professor;

--Questão 10

/* Criar uma procedure para atualizar cidade e estado dos professores */

create or replace procedure updCityEst(matriculap in number, cidadep in varchar, estadop in CHAR) 
is 
    max_char number := 2;
    begin 
        update professor set cidade = cidadep where matricula = matriculap;
        update professor set estado = estadop where matricula = matriculap;
    end;
    
/* Executar a procedure anterior */
exec updcityest (700, 'Jataúba', 'pe');
drop PROCEDURE updcityest;



