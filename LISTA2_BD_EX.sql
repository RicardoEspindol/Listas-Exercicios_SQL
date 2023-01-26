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
	
	
	 --------------------------------------------
	CREATE TABLE funcionario
	(
		id int,
		nome varchar(60),
		salario decimal,
		sexo char(1),
		idade int,
		cidade varchar(60),
		estado char(2),
			PRIMARY KEY (id)
	);
	
	INSERT INTO funcionario(id, nome, salario, sexo, idade, cidade, estado) VALUES
	(1,'Josias da Silva', 2350, 'm', 22, 'Maceió', 'AL'),
	(2,'Mariane Paiva', 1400, 'f', 20, 'Recife', 'PE'),
	(3,'Ariane Pereira', 2500, 'f', 20, 'Rodelas', 'BA'),
	(4,'João Marcelo', 650, 'm', 25, 'Rodelas', 'BA'),
	(5,'Lucas Saraiva', 500, 'm', 25, 'Recife', 'PE'),
	(6,'Maria Raquel', 600, 'f', 40, 'Recife', 'PE');

	SELECT * FROM FUNCIONARIO;
	--------------------------------------------------
	SELECT NOME, SEXO
	FROM FUNCIONARIO
	WHERE ESTADO = 'BA';
	-----------------------------------------------
	SELECT NOME, SALARIO
	FROM FUNCIONARIO
	WHERE SALARIO > 800;
	--------------------------------------------------
	SELECT ESTADO, NOME
	FROM FUNCIONARIO
	WHERE ESTADO != 'AL'
	ORDER BY NOME DESC;
	---------------------------------------------------
	SELECT NOME
	FROM FUNCIONARIO
	WHERE NOME LIKE'%va';
	-----------------------------------------------------
	SELECT * FROM FUNCIONARIO
	WHERE NOME LIKE '%o%' AND SEXO = 'm';
	
	------------------------------------------------------
	SELECT * FROM FUNCIONARIO
	WHERE IDADE 
	BETWEEN 18 AND 25
	ORDER BY IDADE ASC;
	-------------------------------------------------------
	SELECT * FROM FUNCIONARIO
	WHERE ESTADO NOT IN ('AL','PE','BA');
	--------------------------------------------------------
	SELECT MAX(SALARIO) AS MAIOR_SALARIO_FEMININO
	FROM FUNCIONARIO
	WHERE SEXO = 'm';
	-----------------------------------------------------
	SELECT MIN(IDADE) AS MENOR_IDADE_PERNAMBUCO
	FROM FUNCIONARIO
	WHERE ESTADO = 'PE';
	------------------------------------------------
	SELECT AVG(SALARIO) AS MEDIA_SALARIAL
	FROM FUNCIONARIO;
	-----------------------------------------------
	SELECT AVG(SALARIO) AS MEDIA_SALARIAL_IDADE
	FROM FUNCIONARIO
	WHERE SEXO = 'm' AND IDADE < 25;
	-------------------------------------------------
	SELECT * FROM FUNCIONARIO
	WHERE SALARIO < 1000;
	---------------------------------------------------
	SELECT DISTINCT CIDADE AS NOME_CIDADES_DISTINTAS
	FROM FUNCIONARIO;
	---------------------------------------------------
	SELECT COUNT(DISTINCT CIDADE) AS QUANT_CIDADES_DISTINTAS
	FROM FUNCIONARIO;
	----------------------------------------------------
	SELECT NOME, SALARIO AS MAIOR_SALARIO
	FROM FUNCIONARIO
	WHERE SALARIO = (SELECT MAX(SALARIO) FROM FUNCIONARIO);
	----------------------------------------------------
	SELECT NOME, IDADE AS MENOR_IDADE
	FROM FUNCIONARIO
	WHERE IDADE = (SELECT MIN(IDADE) FROM FUNCIONARIO);
	------------------------------------------------------
	SELECT NOME, SALARIO
	FROM FUNCIONARIO
	WHERE SALARIO > (SELECT AVG(SALARIO) FROM FUNCIONARIO);
	
	
	
	
	