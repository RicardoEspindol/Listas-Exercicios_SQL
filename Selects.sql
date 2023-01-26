-- Database: bancoRK

-- DROP DATABASE IF EXISTS "bancoRK";

CREATE DATABASE "bancoRK"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	CREATE TABLE aluno (

	matricula bigint NOT NULL,
	nome varchar(70) NOT NULL,
	email varchar(70),
	cpf bigint,
	sexo char(1),
	estado varchar(20),
	cidade varchar(30),
	rua varchar(50),
	login varchar(30),
	senha varchar(30),
	aluno_indicado bigint,
	
	PRIMARY KEY(matricula),
	FOREIGN KEY(aluno_indicado) REFERENCES ALUNO(matricula)
);	

CREATE TABLE telefones_aluno (
	
	matricula_aluno bigint,
	telefone bigint,
	
	PRIMARY KEY(matricula_aluno, telefone),
	FOREIGN KEY(matricula_aluno) REFERENCES ALUNO(matricula)
	);

CREATE TABLE curso(
	id bigint NOT NULL,
	nome varchar(70) NOT NULL,
	grau varchar(20),

	PRIMARY KEY(id)
	);

CREATE TABLE disciplina(

	id bigint NOT NULL,
	nome varchar(70) NOT NULL,
	cpf_professor bigint,
	id_curso bigint,

	PRIMARY KEY(id),
	FOREIGN KEY(cpf_professor) REFERENCES                                 
FUNCIONARIO_PROFESSOR(cpf_funcionario),
	FOREIGN KEY(id_curso) REFERENCES CURSO(id)
	);




CREATE TABLE aluno_cursa_disciplina(

	matricula_aluno bigint,
	id_disciplina bigint,

	PRIMARY KEY(matricula_aluno, id_disciplina),
	FOREIGN KEY(matricula_aluno) REFERENCES ALUNO(matricula),
	FOREIGN KEY(id_disciplina) REFERENCES DISCIPLINA(id)
	);

CREATE TABLE setor(
	
	id bigint NOT NULL,
	nome varchar(70) NOT NULL,
	n_funcionarios int,
	data date,

	PRIMARY KEY(id)
	);

CREATE TABLE universidade(
	
	nome varchar(70) NOT NULL,
	endereco varchar(60),
	email varchar(50),
	telefone bigint,

	PRIMARY KEY(nome)
	);


CREATE TABLE Funcionario (

cpf bigint NOT NULL,
nome varchar(70) NOT NULL,
salario decimal(7,2),
email varchar(70),
estado varchar(20),
cidade varchar(70),
rua varchar(70),
numero_de_registro bigint,
login varchar(30),
senha varchar(30),
dig smallint,

PRIMARY KEY(cpf)
);




CREATE TABLE telefones_funcionario(

cpf_funcionario bigint,
telefone bigint,

PRIMARY KEY (cpf_funcionario, telefone),
FOREIGN KEY (cpf_funcionario) REFERENCES FUNCIONARIO(cpf)
);

CREATE TABLE funcionario_diretor(

cpf_funcionario bigint,
nome_universidade varchar(70),
data_de_posse date,
fim_da_posse date,

PRIMARY KEY(cpf_funcionario),
FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIO(cpf),
FOREIGN KEY(nome_universidade) REFERENCES UNIVERSIDADE(nome)
);

CREATE TABLE funcionario_secretario(

cpf_funcionario bigint,
pis_pasep bigint,
id_setor bigint,

PRIMARY KEY(cpf_funcionario),
FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIO(cpf),
FOREIGN KEY(id_setor) REFERENCES SETOR(id)
);

CREATE TABLE funcionario_professor(

cpf_funcionario bigint,
formacao varchar(70),

PRIMARY KEY(cpf_funcionario),
FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIO(cpf)
);





CREATE TABLE funcionario_coordenador(

cpf_funcionario bigint,
especializacao varchar(70),
id_curso bigint,
nome_aprendiz varchar(70),

PRIMARY KEY(cpf_funcionario),
FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIO(cpf),
FOREIGN KEY(nome_aprendiz ) REFERENCES APRENDIZ(nome)
FOREIGN KEY(id_curso) REFERENCES CURSO(id)
);

CREATE TABLE aprendiz(
	nome varchar(70) NOT NULL,
	cpf_coordenador bigint NOT NULL,
	
	PRIMARY KEY(nome, cpf_coordenador),
	FOREIGN KEY(cpf_coordenador) REFERENCES 
FUNCIONARIO_COORDENADOR(cpf_funcionario)
);

--Testes usando o select--

--Listar nome e sexo dos alunos que moram no estado da Bahia.

SELECT nome, sexo 
FROM aluno 
WHERE estado = 'BA';

--Listar os alunos e o numero da matricula maior que 175.

SELECT nome, matricula 
FROM aluno 
WHERE matricula > 175;

--Listar o estado e o nome dos alunos que não moram em ‘AL’, ordenando o resultado de forma decrescente por nome do aluno.

SELECT nome, estado 
FROM aluno 
WHERE estado != 'AL'
ORDER BY nome DESC;

--Listar todos os dados dos alunos cujos nomes são terminados por ‘va’.

SELECT *
FROM aluno 
WHERE nome LIKE '%va';

--Listar todos os dados dos alunos do sexo masculino que tenham em qualquer parte do nome a letra ‘o’.

SELECT *
FROM aluno 
WHERE sexo = 'M' and nome LIKE '%o%';

--Listar todos os dados dos funcionários do sexo masculino que não tenham em qualquer parte do nome a letra ‘o’.

SELECT *
FROM aluno 
WHERE sexo = 'M' and nome NOT LIKE '%o%';

--Listar todos os dados dos alunos que tenham sua matricula num valor entre 160 e 170, ordenando o resultado de forma crescente por numero da matricula.


SELECT *
FROM aluno 
WHERE matricula
BETWEEN 160 AND 170
ORDER BY matricula ASC;

--Listar os alunos que não são dos estados do Nordeste.

SELECT *
FROM aluno 
WHERE estado NOT IN ('PE','AL','BA','RN','PI','SE','CE','MA','PB');  

--Listar o numero maior entre as matricula dos alunos do sexo feminino.

SELECT MAX(matricula) AS maior_numero_da_matricula_feminino
FROM aluno
WHERE sexo = 'F';

--Listar a menor matricula dos alunos do estado de Pernambuco.

SELECT MIN(matricula) AS Menor_numero_matricula_Pernambuco
FROM aluno
WHERE estado = 'PE';

--Listar a média do número da matricula.

SELECT AVG(matricula) AS Média_matricula 
FROM aluno;

--Listar a média das matriculas dos alunos do sexo masculino, do estado de Pernamuco.

SELECT AVG(matricula) AS Média_matricula_masculino
FROM aluno
WHERE sexo = 'M' and estado = 'PE';

--Listar o total de aluno com numero da matricula abaico de 170.

SELECT *
FROM aluno
WHERE matricula < 170;

--Listar as cidades distintas dos alunos.

SELECT DISTINCT cidade AS cidades_distintas
FROM aluno;

--Listar o total de cidades distintas dos alunos.

SELECT COUNT(DISTINCT cidade) AS total_cidades_distintas
FROM aluno;

--Listar o nome do aluno com maior número da matricula.

SELECT nome,matricula
FROM aluno
WHERE matricula = (SELECT MAX(matricula) FROM aluno);

--Listar o nome do funcionário com menor número da matricula.

SELECT nome,matricula
FROM aluno
WHERE matricula = (SELECT MIN(matricula) FROM aluno);

--Listar os alunos que tenha o número da matricula acima da média do números de matricula

SELECT nome, matricula
FROM aluno
WHERE matricula > (SELECT AVG(matricula) FROM aluno);

-- Uso de Select com Junções --

SELECT f.nome, tf.telefone
FROM funcionario f, telefones_funcionario tf
WHERE f.cpf = tf.cpf_funcionario;

-- Uso de Group By --

SELECT sexo, COUNT(matricula)
FROM aluno
GROUP BY sexo;

-- Uso de Group By com Having --

SELECT cidade, COUNT(matricula)
FROM aluno
GROUP BY  cidade
HAVING cidade <> 'Caruaru';


