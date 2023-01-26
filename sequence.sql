create table fornecedor(
    codigo varchar(5) primary key,
    nome varchar(25)
)

create sequence fornecedor_seq
    minvalue 10
    maxvalue 1000
    start with 10
    increment by 10;
    
select * from fornecedor;
    
insert into fornecedor values (fornecedor_seq.nextval, 'Rodrigo Silva');
insert into fornecedor values (fornecedor_seq.nextval, 'Kaio Lima');
insert into fornecedor values (fornecedor_seq.nextval, 'Ana Larissa');
insert into fornecedor values (fornecedor_seq.nextval, 'Otávio Bezerra');
insert into fornecedor values (fornecedor_seq.nextval, 'Charles Miss');
insert into fornecedor values (fornecedor_seq.nextval, 'Lucas Chagas');
insert into fornecedor values (fornecedor_seq.nextval, 'Mario Feitoza');
insert into fornecedor values (fornecedor_seq.nextval, 'Flávio Cintra');


--Update de dados
UPDATE fornecedor
 SET nome = 'Felipe Silva'
 WHERE codigo = 60; 
 
-- Retornar valor atual
select fornecedor_seq.currval from dual;

-- Update de alteração de autoIncremento
ALTER SEQUENCE fornecedor_seq INCREMENT BY 100;
insert into fornecedor values (fornecedor_seq.nextval, 'Zé Cintra');

--Excluindo Sequence
drop sequence fornecedor_seq;
