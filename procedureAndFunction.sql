create or replace function valorDobrado(valor in number)
return number
is 
    begin 
        return(valor*2);
    end;
    
SELECT valorDobrado(10) FROM dual;
SELECT valorDobrado(9) FROM dual;
SELECT valorDobrado(249) FROM dual;

drop function valordobrado;

--Segunda Função

create or replace function tercaParte(valor in number)
return number
is 
    begin
        return (valor / 3);
    end;
    
SELECT tercaParte(9) FROM dual;
SELECT tercaParte(57) FROM dual;
SELECT tercaParte(16) FROM dual;

-- Terceira Função

create or replace function valorEmDolar(reais in number, cotacao in number)
return number 
is 
    begin 
        return (reais / cotacao);
    end;
    
select valorEmDolar(500,5.31)from dual;
drop function valorEmDolar;

-- Quarta função
create or replace function imc(peso in number, altura in number)
return number 
is 
    begin 
        return (peso / (altura * altura));
    end;

select imc(68, 1.72) from dual;
drop function imc;

--Quinta função
create table funcionario(
    nome varchar(30) primary key,
    salario number(7,2) not null
)
insert into funcionario values('ricardo', 5653.58);
insert into funcionario values('otavio', 5893.28);
insert into funcionario values('icaro', 1545.62);
insert into funcionario values('pedro', 2564.22);
insert into funcionario values('rai', 2653.58);
select * from funcionario;

create or replace procedure aumentaSalario (percentual number)
is 
    begin 
        update funcionario set salario = salario*(1 + (percentual/100));
    end;
    
EXEC aumentasalario(10);

--Função desconto 
create or replace procedure diminuirSalario (percentual number)
is 
    begin 
        update funcionario set salario = salario*(1 - (percentual/100));
    end;
    
EXEC diminuirsalario(10);

drop PROCEDURE diminuirSalario;

--Função cidade Procedure

CREATE TABLE cidade(
    cod_cidade INTEGER NOT NULL,
    nome VARCHAR2(100),
    uf CHAR(2)
)
CREATE OR REPLACE procedure OP_CIDADE(
    vCOD_CIDADE integer,
    vNOME varchar2,
    vUF char,
    vOPR char
    )
is
    vEXCEPTION EXCEPTION;
    BEGIN
        IF (vOPR = 'I') THEN
            INSERT INTO CIDADE(COD_CIDADE, NOME, UF) VALUES (vCOD_CIDADE, vNOME, vUF);
        ELSE
        IF(vOPR = 'A') THEN
            UPDATE CIDADE SET NOME = vNOME, UF = vUF WHERE COD_CIDADE = vCOD_CIDADE;
        ELSE
        IF(vOPR = 'D') THEN
            DELETE FROM CIDADE WHERE COD_CIDADE = vCOD_CIDADE;
        ELSE
        RAISE vEXCEPTION;
            END IF; END IF; END IF;
            EXCEPTION
                WHEN vEXCEPTION THEN
                    RAISE_APPLICATION_ERROR(-20999,'ATENÇÃO! Operação diferente de I, D, A.', FALSE);
     END OP_CIDADE;


insert into cidade values(6,'São Pedro','PI');
EXEC OP_CIDADE(1, 'Recife','PE','I');
EXEC OP_CIDADE(2, 'São Paulo','SP','I');
EXEC OP_CIDADE(9, 'São Corme','SP','I');

EXEC OP_CIDADE(5, 'Sanharó','PE','X');
select * from cidade;

drop PROCEDURE op_cidade;
    
select * from USER_VIEWS;