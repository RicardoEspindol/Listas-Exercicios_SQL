create table vendedor(
    codigo int primary key,
    nome varchar(70),
    idade int,
    tempoDeCasa float,
    estado char(2),
    cidade varchar(50),
    sexo char(1),
    salario number(7,2),
    id_departamento int,
    foreign key(id_departamento) references departamento(id)
);

insert into vendedor values(00,'gustavo',22,1.6,'pe','Belo Jardim','m',2000.00,001);
insert into vendedor values(01,'fabio',25,1.3,'pb','Patos','m',1000.00,004);
insert into vendedor values(02,'ricardo',26,2.8,'ce','Crato','m',5000.00,004);
insert into vendedor values(03,'tomas',54,6.2,'ba','Salvador','m',2600.90,001);
insert into vendedor values(04,'everson',36,1.1,'pe','Recife','m',1984.00,004);
insert into vendedor values(05,'gabi',21,5.0,'rn','Natal','f',6800.99,002);
insert into vendedor values(06,'rayane',42,4.9,'al','Sanharo','f',250.00,003);
insert into vendedor values(07,'elaine',19,4.2,'al','Penedo','f',616.00,003);
insert into vendedor values(08,'violeta',37,2.9,'pe','Pesqueira','f',3499.00,001);
select *from vendedor;

create view vSalario1 as 
select *
from vendedor
where salario BETWEEN 1000 and 2000
order by nome asc;

select *
from vSalario1;

create view vMaiorIdade1 as
select nome, idade as maior_idade
from vendedor
where idade = (select max(idade) from vendedor) ;

select *
from vMaiorIdade1;

create view vMenorTempoDeCasa1 as
select nome, tempodecasa as menor
from vendedor
where tempodecasa= (select min(tempodecasa) from vendedor) ;

select *
from vMenorTempoDeCasa1;


create view vMedioByEstado1 as
select avg(salario) as media, estado
from vendedor
group by estado ;

select *
from vmediobyestado1;

create view vForaNordeste1 as
select *
from vendedor
where estado not in ('pe', 'pb', 'se', 'al', 'pi', 'ma', 'rn','ce','ba');

select *
from vForaNordeste1;

select count(*)
from user_views;



CREATE TABLE departamento
(
    id int primary key,
    nome varchar(70)
);
insert into departamento values (001, 'Logistica');
insert into departamento values (002, 'Financeiro');
insert into departamento values (003, 'Administrativo');
insert into departamento values (004, 'Recursos Humanos');

create view vVendedorDepartamento as 
select vendedor.nome, departamento.nome as def
from vendedor, departamento
where vendedor.id_departamento = departamento.id
order by vendedor.nome asc;

select *
from vvendedordepartamento;

create view vQuantidadeByDepartamento as
select departamento.nome, count(vendedor.codigo) as quantidade
from departamento, vendedor
where departamento.id = vendedor.id_departamento
group by departamento.nome;

select *
from vquantidadebydepartamento;