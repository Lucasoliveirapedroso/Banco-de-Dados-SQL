
 /*
MODELAGEM DE DADOS PARA SISTEMAS

1 - TODO CAMPO VETORIZADO SE TORNA OUTRA TABELA 

[AMARELO, AZUL, LARANJA]

[GOL, FORDKA, UNO]

2- TODO CAMPO MULTIVALORADO SE TORNA OUTRA TABELA 
QUANDO O COMPO É DIVISIL 

CIDADE BAIRRO ESTADO

TODO TABELA NECESSITA QUE PELO MENOS UM CAMPO SE IDENTIFIQUE COMO 
SENDO UNICO 
PRIMARY KEY / CHAVE PRIMARIA

ID_CLIENTE 
*/


CRIANDO BANCO FEITO NA MODELAGEM BR MODELO 

CREATE DATABASE COMERCIO;
USER COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT ,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
	
);

/*
	ENDERECO OBRIGATORIO 
	CADASTRO SOMENTE DE UM
	
	TELEFONE NÃO OBRIGATORIO
	CADASTRO DE MAIS DE 1 OPCIONAL

	CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA 
	QUE VAI ATE A OUTRA TABELA PARA FAZER REFERENCIA  ENTRE REGISTROS
	
	
	RELACIONAMENTO 1X1 A ESTRANGEIRA FICA NA MAIS FRACA
	
	RELACIONAMENTO 1XN A CHAVE ESTRANGEIRA SEMPRE FICA NA CARDINALIDADE N 

*/

--DADOS PARA TABELA CLIENTE

INSERT INTO CLIENTE VALUES(NULL, 'LUCAS', 'M', 'LUCAS1@GMAIL.COM', '12345678911');
INSERT INTO CLIENTE VALUES(NULL, 'ANA', 'F', 'ANA1@GMAIL.COM', '12345678912');
INSERT INTO CLIENTE VALUES(NULL, 'PAULO', 'M', 'PAULO@GMAIL.COM', '12345678913');
INSERT INTO CLIENTE VALUES(NULL, 'MATT', 'M', 'MATT1@GMAIL.COM', '12345678914');
INSERT INTO CLIENTE VALUES(NULL, 'FRAN', 'F', 'FRAN@GMAIL.COM', '12345678915');
INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAO1@GMAIL.COM', '12345678916');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', NULL, '12345678917');

SELECT * FROM CLIENTE;

INSERT INTO ENDERECO VALUES(NULL, 'CERRO AZUL', 'PAULISTA', 'COLOMBO', 'PR', 1);
INSERT INTO ENDERECO VALUES(NULL, 'CEO AMARELO', 'PAULISTA', 'COLOMBO', 'SP', 2);
INSERT INTO ENDERECO VALUES(NULL, 'ASFALTO AZUL', 'PAULISTA', 'COLOMBO', 'RJ', 3);
INSERT INTO ENDERECO VALUES(NULL, 'TERRA ROXA', 'PAULISTA', 'COLOMBO', 'PR', 4);
INSERT INTO ENDERECO VALUES(NULL, 'PRESIDENTE LULA', 'PAULISTA', 'COLOMBO', 'PR', 5);
INSERT INTO ENDERECO VALUES(NULL, 'ROCINHA', 'PAULISTA', 'COLOMBO', 'RS', 6);
INSERT INTO ENDERECO VALUES(NULL, 'RUA DE BAIXO', 'PAULISTA', 'COLOMBO', 'RN', 7);

SELECT * FROM ENDERECO;

INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585474', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585471', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585472', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585473', 2);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585475', 3);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585476', 4);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585477', 7);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585478', 6);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585479', 4);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '9856585470', 2);

SELECT * FROM TELEFONE;


--SELEÇÃO, PROJEÇÃO E JUNÇÃO
/*

PROJEÇÃO É TUDO QUER VER NA TELA 

VEM DA TABELA 

SELECT "O QUE QUER"

SELECT CLIENTE, IDADE, ETC

*/

/*
SELEÇÃO
TRAZER UM SUBCONJUNTO DO CONJUNTO TOTAL DE UMA TABELAS
CLAUSULA DE SELEÇÃO E O WHERE

SELECT NOME, SEXO EMAIL - PROJEÇÃO 
FROM CLIENTE 
WHERE SEXO = 'F'; - SELEÇÃO

*/

/* JUNÇÃO -> JOIN */
SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

+---------+-------------------+-----------+
| NOME    | EMAIL             | IDCLIENTE |
+---------+-------------------+-----------+
| LUCAS   | LUCAS1@GMAIL.COM  |         1 |
| ANA     | ANA1@GMAIL.COM    |         2 |
| PAULO   | PAULO@GMAIL.COM   |         3 |
| MATT    | MATT1@GMAIL.COM   |         4 |
| FRAN    | FRAN@GMAIL.COM    |         5 |
| JOAO    | JOAO1@GMAIL.COM   |         6 |
| JORGE   | NULL              |         7 |
| FLAVIO  | FLAVIO@IG.COM     |         8 |
| ANDRE   | ANDRE@GLOBO.COM   |         9 |
| GIOVANA | NULL              |        10 |
| KARLA   | KARLA@GMAIL.COM   |        11 |
| DANIELE | DANIELE@GMAIL.COM |        12 |
| LORENA  | NULL              |        13 |
| EDUARDO | NULL              |        14 |
| ANTONIO | ANTONIO@IG.COM    |        15 |
| ANTONIO | ANTONIO@UOL.COM   |        16 |
| ELAINE  | ELAINE@GLOBO.COM  |        17 |
| CARMEM  | CARMEM@IG.COM     |        18 |
| ADRIANA | ADRIANA@GMAIL.COM |        19 |
| JOICE   | JOICE@GMAIL.COM   |        20 |
+---------+-------------------+-----------+

SELECT ID_CLIENTE,BAIRRO, CIDADE
FROM ENDERECO;

+------------+------------+----------------+
| ID_CLIENTE | BAIRRO     | CIDADE         |
+------------+------------+----------------+
|          1 | PAULISTA   | COLOMBO        |
|          2 | PAULISTA   | COLOMBO        |
|          3 | PAULISTA   | COLOMBO        |
|          4 | PAULISTA   | COLOMBO        |
|          5 | PAULISTA   | COLOMBO        |
|          6 | PAULISTA   | COLOMBO        |
|          7 | PAULISTA   | COLOMBO        |
|          9 | CASCADURA  | B. HORIZONTE   |
|         10 | ESTACIO    | RIO DE JANEIRO |
|         11 | CENTRO     | RIO DE JANEIRO |
|         12 | COPACABANA | RIO DE JANEIRO |
|         13 | CENTRO     | VITORIA        |
|         14 | LEBLON     | RIO DE JANEIRO |
|         15 | CENTRO     | CURITIBA       |
|         16 | JARDINS    | SAO PAULO      |
|         17 | BOM RETIRO | CURITIBA       |
|         18 | LAPA       | SAO PAULO      |
|         19 | CENTRO     | RIO DE JANEIRO |
|         20 | CENTRO     | RIO DE JANEIRO |
+------------+------------+----------------+

--NOME, SEXO, BAIRRO, CIDADE DE TODOS OS CLIENTES

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;

+---------+------+------------+----------------+
| NOME    | SEXO | BAIRRO     | CIDADE         |
+---------+------+------------+----------------+
| LUCAS   | M    | PAULISTA   | COLOMBO        |
| ANA     | F    | PAULISTA   | COLOMBO        |
| PAULO   | M    | PAULISTA   | COLOMBO        |
| MATT    | M    | PAULISTA   | COLOMBO        |
| FRAN    | F    | PAULISTA   | COLOMBO        |
| JOAO    | M    | PAULISTA   | COLOMBO        |
| JORGE   | M    | PAULISTA   | COLOMBO        |
| ANDRE   | M    | CASCADURA  | B. HORIZONTE   |
| GIOVANA | F    | ESTACIO    | RIO DE JANEIRO |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO |
| DANIELE | F    | COPACABANA | RIO DE JANEIRO |
| LORENA  | F    | CENTRO     | VITORIA        |
| EDUARDO | M    | LEBLON     | RIO DE JANEIRO |
| ANTONIO | M    | CENTRO     | CURITIBA       |
| ANTONIO | M    | JARDINS    | SAO PAULO      |
| ELAINE  | F    | BOM RETIRO | CURITIBA       |
| CARMEM  | F    | LAPA       | SAO PAULO      |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO |
+---------+------+------------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';

+---------+------+------------+----------------+
| NOME    | SEXO | BAIRRO     | CIDADE         |
+---------+------+------------+----------------+
| ANA     | F    | PAULISTA   | COLOMBO        |
| FRAN    | F    | PAULISTA   | COLOMBO        |
| GIOVANA | F    | ESTACIO    | RIO DE JANEIRO |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO |
| DANIELE | F    | COPACABANA | RIO DE JANEIRO |
| LORENA  | F    | CENTRO     | VITORIA        |
| ELAINE  | F    | BOM RETIRO | CURITIBA       |
| CARMEM  | F    | LAPA       | SAO PAULO      |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO |
+---------+------+------------+----------------+

--ESSE MODO FUNCIONADA MAS NÃO É CORRETO!!

-- MODO CORRETO É JOIN 

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

+---------+------+------------+----------------+
| NOME    | SEXO | BAIRRO     | CIDADE         |
+---------+------+------------+----------------+
| LUCAS   | M    | PAULISTA   | COLOMBO        |
| ANA     | F    | PAULISTA   | COLOMBO        |
| PAULO   | M    | PAULISTA   | COLOMBO        |
| MATT    | M    | PAULISTA   | COLOMBO        |
| FRAN    | F    | PAULISTA   | COLOMBO        |
| JOAO    | M    | PAULISTA   | COLOMBO        |
| JORGE   | M    | PAULISTA   | COLOMBO        |
| ANDRE   | M    | CASCADURA  | B. HORIZONTE   |
| GIOVANA | F    | ESTACIO    | RIO DE JANEIRO |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO |
| DANIELE | F    | COPACABANA | RIO DE JANEIRO |
| LORENA  | F    | CENTRO     | VITORIA        |
| EDUARDO | M    | LEBLON     | RIO DE JANEIRO |
| ANTONIO | M    | CENTRO     | CURITIBA       |
| ANTONIO | M    | JARDINS    | SAO PAULO      |
| ELAINE  | F    | BOM RETIRO | CURITIBA       |
| CARMEM  | F    | LAPA       | SAO PAULO      |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO |
+---------+------+------------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';

+---------+------+------------+----------------+
| NOME    | SEXO | BAIRRO     | CIDADE         |
+---------+------+------------+----------------+
| ANA     | F    | PAULISTA   | COLOMBO        |
| FRAN    | F    | PAULISTA   | COLOMBO        |
| GIOVANA | F    | ESTACIO    | RIO DE JANEIRO |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO |
| DANIELE | F    | COPACABANA | RIO DE JANEIRO |
| LORENA  | F    | CENTRO     | VITORIA        |
| ELAINE  | F    | BOM RETIRO | CURITIBA       |
| CARMEM  | F    | LAPA       | SAO PAULO      |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO |
+---------+------+------------+----------------+

--COM OUTRA TEBELAA

SELECT NOME, SEXO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'M';
+---------+------+------------+
| NOME    | SEXO | NUMERO     |
+---------+------+------------+
| LUCAS   | M    | 9856585471 |
| LUCAS   | M    | 9856585472 |
| PAULO   | M    | 9856585475 |
| MATT    | M    | 9856585476 |
| MATT    | M    | 9856585479 |
| JOAO    | M    | 9856585478 |
| JORGE   | M    | 9856585477 |
| ANDRE   | M    | 68976565   |
| ANDRE   | M    | 99656675   |
| ANTONIO | M    | 89966809   |
| ANTONIO | M    | 88679978   |
+---------+------+------------+

SELECT NOME, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;
+---------+-------------------+------+------------+
| NOME    | EMAIL             | TIPO | NUMERO     |
+---------+-------------------+------+------------+
| FRAN    | FRAN@GMAIL.COM    | CEL  | 9856585474 |
| FRAN    | FRAN@GMAIL.COM    | CEL  | 9856585474 |
| LUCAS   | LUCAS1@GMAIL.COM  | CEL  | 9856585471 |
| LUCAS   | LUCAS1@GMAIL.COM  | CEL  | 9856585472 |
| ANA     | ANA1@GMAIL.COM    | CEL  | 9856585473 |
| PAULO   | PAULO@GMAIL.COM   | CEL  | 9856585475 |
| MATT    | MATT1@GMAIL.COM   | CEL  | 9856585476 |
| JORGE   | NULL              | CEL  | 9856585477 |
| JOAO    | JOAO1@GMAIL.COM   | CEL  | 9856585478 |
| MATT    | MATT1@GMAIL.COM   | CEL  | 9856585479 |
| ANA     | ANA1@GMAIL.COM    | CEL  | 9856585470 |
| ANDRE   | ANDRE@GLOBO.COM   | RES  | 68976565   |
| ANDRE   | ANDRE@GLOBO.COM   | CEL  | 99656675   |
| KARLA   | KARLA@GMAIL.COM   | CEL  | 33567765   |
| KARLA   | KARLA@GMAIL.COM   | CEL  | 88668786   |
| KARLA   | KARLA@GMAIL.COM   | COM  | 55689654   |
| DANIELE | DANIELE@GMAIL.COM | COM  | 88687979   |
| LORENA  | NULL              | COM  | 88965676   |
| ANTONIO | ANTONIO@IG.COM    | CEL  | 89966809   |
| ANTONIO | ANTONIO@UOL.COM   | COM  | 88679978   |
| ELAINE  | ELAINE@GLOBO.COM  | CEL  | 99655768   |
| CARMEM  | CARMEM@IG.COM     | RES  | 89955665   |
| ADRIANA | ADRIANA@GMAIL.COM | RES  | 77455786   |
| ADRIANA | ADRIANA@GMAIL.COM | RES  | 89766554   |
| JOICE   | JOICE@GMAIL.COM   | RES  | 77755785   |
| JOICE   | JOICE@GMAIL.COM   | COM  | 44522578   |
+---------+-------------------+------+------------+


-- NOME SEXO BAIRRO CIDADE TIPO NUMERO DE TODOS CLIENTES

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------+------+------------+----------------+------+------------+
| NOME    | SEXO | BAIRRO     | CIDADE         | TIPO | NUMERO     |
+---------+------+------------+----------------+------+------------+
| LUCAS   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585471 |
| LUCAS   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585472 |
| ANA     | F    | PAULISTA   | COLOMBO        | CEL  | 9856585473 |
| ANA     | F    | PAULISTA   | COLOMBO        | CEL  | 9856585470 |
| PAULO   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585475 |
| MATT    | M    | PAULISTA   | COLOMBO        | CEL  | 9856585476 |
| MATT    | M    | PAULISTA   | COLOMBO        | CEL  | 9856585479 |
| FRAN    | F    | PAULISTA   | COLOMBO        | CEL  | 9856585474 |
| FRAN    | F    | PAULISTA   | COLOMBO        | CEL  | 9856585474 |
| JOAO    | M    | PAULISTA   | COLOMBO        | CEL  | 9856585478 |
| JORGE   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585477 |
| ANDRE   | M    | CASCADURA  | B. HORIZONTE   | RES  | 68976565   |
| ANDRE   | M    | CASCADURA  | B. HORIZONTE   | CEL  | 99656675   |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO | CEL  | 33567765   |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO | CEL  | 88668786   |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO | COM  | 55689654   |
| DANIELE | F    | COPACABANA | RIO DE JANEIRO | COM  | 88687979   |
| LORENA  | F    | CENTRO     | VITORIA        | COM  | 88965676   |
| ANTONIO | M    | CENTRO     | CURITIBA       | CEL  | 89966809   |
| ANTONIO | M    | JARDINS    | SAO PAULO      | COM  | 88679978   |
| ELAINE  | F    | BOM RETIRO | CURITIBA       | CEL  | 99655768   |
| CARMEM  | F    | LAPA       | SAO PAULO      | RES  | 89955665   |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO | RES  | 77455786   |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO | RES  | 89766554   |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO | RES  | 77755785   |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO | COM  | 44522578   |
+---------+------+------------+----------------+------+------------+

--COM APELIDO 

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;  

+---------+------+------------+----------------+------+------------+
| NOME    | SEXO | BAIRRO     | CIDADE         | TIPO | NUMERO     |
+---------+------+------------+----------------+------+------------+
| LUCAS   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585471 |
| LUCAS   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585472 |
| ANA     | F    | PAULISTA   | COLOMBO        | CEL  | 9856585473 |
| ANA     | F    | PAULISTA   | COLOMBO        | CEL  | 9856585470 |
| PAULO   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585475 |
| MATT    | M    | PAULISTA   | COLOMBO        | CEL  | 9856585476 |
| MATT    | M    | PAULISTA   | COLOMBO        | CEL  | 9856585479 |
| FRAN    | F    | PAULISTA   | COLOMBO        | CEL  | 9856585474 |
| FRAN    | F    | PAULISTA   | COLOMBO        | CEL  | 9856585474 |
| JOAO    | M    | PAULISTA   | COLOMBO        | CEL  | 9856585478 |
| JORGE   | M    | PAULISTA   | COLOMBO        | CEL  | 9856585477 |
| ANDRE   | M    | CASCADURA  | B. HORIZONTE   | RES  | 68976565   |
| ANDRE   | M    | CASCADURA  | B. HORIZONTE   | CEL  | 99656675   |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO | CEL  | 33567765   |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO | CEL  | 88668786   |
| KARLA   | F    | CENTRO     | RIO DE JANEIRO | COM  | 55689654   |
| DANIELE | F    | COPACABANA | RIO DE JANEIRO | COM  | 88687979   |
| LORENA  | F    | CENTRO     | VITORIA        | COM  | 88965676   |
| ANTONIO | M    | CENTRO     | CURITIBA       | CEL  | 89966809   |
| ANTONIO | M    | JARDINS    | SAO PAULO      | COM  | 88679978   |
| ELAINE  | F    | BOM RETIRO | CURITIBA       | CEL  | 99655768   |
| CARMEM  | F    | LAPA       | SAO PAULO      | RES  | 89955665   |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO | RES  | 77455786   |
| ADRIANA | F    | CENTRO     | RIO DE JANEIRO | RES  | 89766554   |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO | RES  | 77755785   |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO | COM  | 44522578   |
+---------+------+------------+----------------+------+------------+



/* DEFINIÇÃO DE LINGUAGEM */

--DML = DATA MANIPULATION LANGUAGE

INSERT INTO
SELECT
UPDATE
DELETE

--SEMPRE QUE FOR EDITAR FAZER A BUSCA PARA VER SE RETORNA 1 OU +

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE = 7;



/* DEFINIÇÃO DE LINGUAGEM */
-- DDL = DATA DEFINITION LANGUAGE 
-- TUDO QUE FAZ EM DEFINIÇÃO DE UMA TABELA É DDL 

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30) NOT NULL,
	PRECO INT
);  --ESTÁ DEFININDO A TABELA 



+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDPRODUTO | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | NO   |     | NULL    |                |
| PRECO     | int(11)     | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


ALTER TABLE PRODUTO 
CHANGE PRECO VALOR INT NOT NULL; --PODE ALTERAR E ADICIONAR CLAUSULAS


+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDPRODUTO | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | NO   |     | NULL    |                |
| VALOR     | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

--MODIFY ALTERANDO O TIPO 

ALTER TABLE PRODUTO 
MODIFY VALOR VARCHAR(50) NOT NULL;

DESC PRODUTO;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDPRODUTO | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | NO   |     | NULL    |                |
| VALOR     | varchar(50) | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO 
MODIFY VALOR INT NOT NULL;

+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDPRODUTO | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | NO   |     | NULL    |                |
| VALOR     | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


-- ALTER TABLE ADD

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDPRODUTO | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | NO   |     | NULL    |                |
| VALOR     | int(11)     | NO   |     | NULL    |                |
| PES0      | float(10,2) | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

--APAGAR COLUNA PRODUTO 

ALTER TABLE PRODUTO
DROP COLUMN PESO;
 

/* DEFINIÇÃO DE LINGUAGEM */
--DCL = DATA CONTROL LANGUAGE 


/* DEFINIÇÃO DE LINGUAGEM */
TCL = TRANSACTION CONTROL LANGUAGE
/*
	
	DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE

*/

/* INSERT */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */ 

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* 
  DDL - DATA DEFINITION LANGUAGE
*/

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;