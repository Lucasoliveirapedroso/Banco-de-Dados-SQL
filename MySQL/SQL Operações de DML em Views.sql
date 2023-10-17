--Operações de DML em Views
--UPDATE, INSERT E DELETE

INSERT INTO V_RELATORIO VALUES(
'ANDREIA', 'F', 'ANDREIA@GMAIL.COM', 'CEL', '41552886548', 'CENTRO', 'PARANINS' 'PR'
);

-- NÃO PODEMOS INSERIR EM VIEWS COM INNER JOIN
ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list

CREATE TABLE JOGADORES(
	IDJOGADOR INT, 
	NOME VARCHAR(30),
	ESTADO CHAR(2)
);

INSERT INTO JOGADORES VALUES(1, 'LUCIANO', 'PR');
INSERT INTO JOGADORES VALUES(2, 'AMOZENOS', 'AM');
INSERT INTO JOGADORES VALUES(3, 'PAULO', 'MG');
INSERT INTO JOGADORES VALUES(4, 'MESSI', 'MT');
INSERT INTO JOGADORES VALUES(5, 'LUGANO', 'ES');
INSERT INTO JOGADORES VALUES(6, 'LUCAS', 'SP');
INSERT INTO JOGADORES VALUES(7, 'RONALDO', 'PT');

+-----------+----------+--------+
| IDJOGADOR | NOME     | ESTADO |
+-----------+----------+--------+
|         1 | LUCIANO  | PR     |
|         2 | AMOZENOS | AM     |
|         3 | PAULO    | MG     |
|         4 | MESSI    | MT     |
|         5 | LUGANO   | ES     |
|         6 | LUCAS    | SP     |
|         6 | LUCAS    | SP     |
+-----------+----------+--------+


--CRIAR A VIEW JOGADORES
CREATE VIEW V_JOGADORES AS 
SELECT NOME, ESTADO
FROM JOGADORES;

SELECT * FROM V_JOGADORES;
+----------+--------+
| NOME     | ESTADO |
+----------+--------+
| LUCIANO  | PR     |
| AMOZENOS | AM     |
| PAULO    | MG     |
| MESSI    | MT     |
| LUGANO   | ES     |
| LUCAS    | SP     |
| LUCAS    | SP     |
+----------+--------+

-- OPERAÇOES DML NÃO É POSSIEL NO CENARIO DE INNER JOIN, SEM DELETE SEM INSERT

--UPDATE VIEW É POSSIVEL, POSSIVEL, QUANDO NÃO TEM JOIN NA VIEW É POSSIVEL DELETAR E INSERIR 

SELECT * FROM V_RELATORIO;

+---------+------+-------------------+------+------------+------------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO     | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+------------+------------+----------------+--------+
| LUCAS   | M    | LUCAS1@GMAIL.COM  | CEL  | 9856585471 | PAULISTA   | COLOMBO        | PR     |
| LUCAS   | M    | LUCAS1@GMAIL.COM  | CEL  | 9856585472 | PAULISTA   | COLOMBO        | PR     |
| ANA     | F    | ANA1@GMAIL.COM    | CEL  | 9856585473 | PAULISTA   | COLOMBO        | SP     |
| ANA     | F    | ANA1@GMAIL.COM    | CEL  | 9856585470 | PAULISTA   | COLOMBO        | SP     |
+---------+------+-------------------+------+------------+------------+----------------+--------+

UPDATE V_RELATORIO
SET NOME = 'ANALICE'
WHERE NOME = 'ANA';
-- APÓS ALTERAR NOME 

+---------+------+-------------------+------+------------+------------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO     | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+------------+------------+----------------+--------+
| LUCAS   | M    | LUCAS1@GMAIL.COM  | CEL  | 9856585471 | PAULISTA   | COLOMBO        | PR     |
| LUCAS   | M    | LUCAS1@GMAIL.COM  | CEL  | 9856585472 | PAULISTA   | COLOMBO        | PR     |
| ANALICE | F    | ANA1@GMAIL.COM    | CEL  | 9856585473 | PAULISTA   | COLOMBO        | SP     |
| ANALICE | F    | ANA1@GMAIL.COM    | CEL  | 9856585470 | PAULISTA   | COLOMBO        | SP     |
+---------+------+-------------------+------+------------+------------+----------------+--------+

--DELETANDO VIEW JOGADOR

SELECT * FROM V_JOGADORES;
+----------+--------+
| NOME     | ESTADO |
+----------+--------+
| LUCIANO  | PR     |
| AMOZENOS | AM     |
| PAULO    | MG     |
| MESSI    | MT     |
| LUGANO   | ES     |
| LUCAS    | SP     |
| LUCAS    | SP     |
+----------+--------+

DELETE FROM V_JOGADORES
WHERE NOME = 'LUGANO'; --APAGOU LUGANO, QUANDO NÃO TEM JOIN CONSEGUE DELETAR E INSERIR
+----------+--------+
| NOME     | ESTADO |
+----------+--------+
| LUCIANO  | PR     |
| AMOZENOS | AM     |
| PAULO    | MG     |
| MESSI    | MT     |
| LUCAS    | SP     |
| LUCAS    | SP     |
+----------+--------+

INSERT INTO V_JOGADORES VALUES('PABLO', 'ES');
+----------+--------+
| NOME     | ESTADO |
+----------+--------+
| LUCIANO  | PR     |
| AMOZENOS | AM     |
| PAULO    | MG     |
| MESSI    | MT     |
| LUCAS    | SP     |
| LUCAS    | SP     |
| PABLO    | ES     |-- ADICIONOU PABLO, FOI NULL
+----------+--------+

--SELECIONAR EM VIEWS
SELECT NOME, SEXO, NUMERO FROM V_RELATORIO
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