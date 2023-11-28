--  funções de agregações 

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30),
	SEXO CHAR (1),
	JANEIRO FLOAT (10,2),
	FEVEREITO FLOAT (10,2),
	MARCO FLOAT (10,2)
);

INSERT INTO VENDEDORES VALUES (NULL, 'LUCAS', 'M', 4545.45, 7518.35, 4593.54);
INSERT INTO VENDEDORES VALUES (NULL, 'MARIA', 'F', 2545.45, 5371.35, 3454.54);
INSERT INTO VENDEDORES VALUES (NULL, 'SON', 'M', 8956.45, 3912.35, 4554.54);
INSERT INTO VENDEDORES VALUES (NULL, 'KANE', 'M', 3284.45, 93145.35, 4527.54);
INSERT INTO VENDEDORES VALUES (NULL, 'RONALDO', 'M', 6422.45, 6487.35, 9632.54);
INSERT INTO VENDEDORES VALUES (NULL, 'MESSI', 'M', 5989.45, 6542.35, 1254.54);
INSERT INTO VENDEDORES VALUES (NULL, 'LARISSA', 'F', 3657.45, 1452.35, 9854.54);

SELECT * FROM VENDEDORES;
+------------+---------+------+---------+-----------+---------+
| IDVENDEDOR | NOME    | SEXO | JANEIRO | FEVEREITO | MARCO   |
+------------+---------+------+---------+-----------+---------+
|          1 | LUCAS   | M    | 4545.45 |   7518.35 | 4593.54 |
|          2 | MARIA   | F    | 2545.45 |   5371.35 | 3454.54 |
|          3 | SON     | M    | 8956.45 |   3912.35 | 4554.54 |
|          4 | KANE    | M    | 3284.45 |  93145.35 | 4527.54 |
|          5 | RONALDO | M    | 6422.45 |   6487.35 | 9632.54 |
|          6 | MESSI   | M    | 5989.45 |   6542.35 | 1254.54 |
|          7 | LARISSA | F    | 3657.45 |   1452.35 | 9854.54 |
+------------+---------+------+---------+-----------+---------+

--MAX TRAS UM VALOR MAXIMO DE UMA COLUNA 

SELECT MAX(FEVEREITO) AS MAIOR_VALOR_FEVEREIRO FROM VENDEDORES;

+-----------------------+
| MAIOR_VALOR_FEVEREIRO |
+-----------------------+
|              93145.35 |
+-----------------------+


SELECT MAX(JANEIRO) AS MAIOR_VALOR_JANEIRO FROM VENDEDORES;
+---------------------+
| MAIOR_VALOR_JANEIRO |
+---------------------+
|             8956.45 |
+---------------------+

SELECT JANEIRO AS MAIOR_VALOR_JANEIRO, NOME
FROM VENDEDORES
ORDER BY JANEIRO DESC
LIMIT 1;

+---------------------+------+
| MAIOR_VALOR_JANEIRO | NOME |
+---------------------+------+
|             8956.45 | SON  |
+---------------------+------+

-- min menor valor da coluna 

SELECT MIN(JANEIRO) AS MENOR_VALOR_JANEIRO FROM VENDEDORES;

+---------------------+
| MENOR_VALOR_JANEIRO |
+---------------------+
|             2545.45 |
+---------------------+

-- COM NOME

SELECT JANEIRO AS MENOR_VALOR_JANEIRO, NOME
FROM VENDEDORES
ORDER BY JANEIRO ASC
LIMIT 1;


+---------------------+-------+
| MENOR_VALOR_JANEIRO | NOME  |
+---------------------+-------+
|             2545.45 | MARIA |
+---------------------+-------+


--AVG MEDIA SOMA E DIVIDE

SELECT AVG(JANEIRO) AS MEDIA_JANEIRO FROM VENDEDORES;

+---------------+
| MEDIA_JANEIRO |
+---------------+
|   5057.307234 |
+---------------+

--VARIAS FUNÇÕES

SELECT MAX(JANEIRO) AS MAIOR_VALOR_JANEIRO,
	MIN(JANEIRO) AS MENOR_VALOR_JANEIRO,
	AVG(JANEIRO) AS MEDIA_JANEIRO
FROM VENDEDORES; 

+---------------------+---------------------+---------------+
| MAIOR_VALOR_JANEIRO | MENOR_VALOR_JANEIRO | MEDIA_JANEIRO |
+---------------------+---------------------+---------------+
|             8956.45 |             2545.45 |   5057.307234 |
+---------------------+---------------------+---------------+

--TRUNCATE  DELIMITA O NUMERO DE CASAS DECIMAIS

SELECT MAX(JANEIRO) AS MAIOR_VALOR_JANEIRO,
	MIN(JANEIRO) AS MENOR_VALOR_JANEIRO,
	TRUNCATE (AVG(JANEIRO),2) AS MEDIA_JANEIRO
FROM VENDEDORES;

+---------------------+---------------------+---------------+
| MAIOR_VALOR_JANEIRO | MENOR_VALOR_JANEIRO | MEDIA_JANEIRO |
+---------------------+---------------------+---------------+
|             8956.45 |             2545.45 |       5057.30 |
+---------------------+---------------------+---------------+

-- SUM SOMA TODA UMA COLUNA

SELECT SUM(JANEIRO) AS SOMA_TOTAL_JANEIRO 
FROM VENDEDORES;

+--------------------+
| SOMA_TOTAL_JANEIRO |
+--------------------+
|           35401.15 |
+--------------------+

-- MAIS VALORES SOMADOS

SELECT SUM(JANEIRO) AS SOMA_TOTAL_JANEIRO,
	SUM(FEVEREITO) AS SOMA_TOTAL_FEVEREIRO,
	SUM(MARCO) AS SOMA_TOTAL_MARÇO  
FROM VENDEDORES;

+--------------------+----------------------+-------------------+
| SOMA_TOTAL_JANEIRO | SOMA_TOTAL_FEVEREIRO | SOMA_TOTAL_MARÇO  |
+--------------------+----------------------+-------------------+
|           35401.15 |            124429.45 |          37871.78 |
+--------------------+----------------------+-------------------+

--VENDAS DO SEXO MASCULINO

SELECT SUM(JANEIRO) AS SOMA_TOTAL_JANEIRO,
	SUM(FEVEREITO) AS SOMA_TOTAL_FEVEREIRO,
	SUM(MARCO) AS SOMA_TOTAL_MARÇO  
FROM VENDEDORES
WHERE SEXO = 'M';

+--------------------+----------------------+-------------------+
| SOMA_TOTAL_JANEIRO | SOMA_TOTAL_FEVEREIRO | SOMA_TOTAL_MARÇO  |
+--------------------+----------------------+-------------------+
|           29198.25 |            117605.75 |          24562.70 |
+--------------------+----------------------+-------------------+

-- VENDAS DO SEXO FEMININO

SELECT SUM(JANEIRO) AS SOMA_TOTAL_JANEIRO,
	SUM(FEVEREITO) AS SOMA_TOTAL_FEVEREIRO,
	SUM(MARCO) AS SOMA_TOTAL_MARÇO  
FROM VENDEDORES
WHERE SEXO = 'F';

+--------------------+----------------------+-------------------+
| SOMA_TOTAL_JANEIRO | SOMA_TOTAL_FEVEREIRO | SOMA_TOTAL_MARÇO  |
+--------------------+----------------------+-------------------+
|            6202.90 |              6823.70 |          13309.08 |
+--------------------+----------------------+-------------------+

-- SUM GROUP BY

SELECT SEXO, SUM(JANEIRO) AS SOMA_TOTAL_JANEIRO,
	SUM(FEVEREITO) AS SOMA_TOTAL_FEVEREIRO,
	SUM(MARCO) AS SOMA_TOTAL_MARÇO  
FROM VENDEDORES
GROUP BY SEXO;

+------+--------------------+----------------------+-------------------+
| SEXO | SOMA_TOTAL_JANEIRO | SOMA_TOTAL_FEVEREIRO | SOMA_TOTAL_MARÇO  |
+------+--------------------+----------------------+-------------------+
| F    |            6202.90 |              6823.70 |          13309.08 |
| M    |           29198.25 |            117605.75 |          24562.70 |
+------+--------------------+----------------------+-------------------+