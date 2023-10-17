--ORDENANDO DADOS

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'DANI');
INSERT INTO ALUNOS VALUES(2,'PEDRO');
INSERT INTO ALUNOS VALUES(3,'PEDRO');
INSERT INTO ALUNOS VALUES(1,'FOGO');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE');

SELECT * FROM ALUNOS;


SELECT * FROM ALUNOS
ORDER BY NUMEROS;

SELECT * FROM ALUNOS
ORDER BY 1; --PODEMOS ORDENAR POR NUMERO DE COLUNA

SELECT * FROM ALUNOS
ORDER BY 2;

--PODEMOS ORDENAR MAIS DE UMA COLUNA
SELECT * FROM ALUNOS
ORDER BY 1, 2;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIOVANI |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+


SELECT * FROM ALUNOS
ORDER BY 2, 1;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      2 | ANDRE   |
|      5 | ANTONIO |
|      1 | CLARA   |
|      3 | CLARA   |
|      4 | GIOVANI |
|      1 | JANAINA |
|      5 | JANAINA |
|      1 | JOAO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+

-- DESC ASC
SELECT NOME, NUMERO  FROM ALUNOS
ORDER BY NOME ASC , NUMERO DESC;

+---------+--------+
| NOME    | NUMERO |
+---------+--------+
| ANA     |      6 |
| ANDRE   |      2 |
| ANTONIO |      5 |
| CLARA   |      3 |
| CLARA   |      1 |
| GIOVANI |      4 |
| JANAINA |      5 |
| JANAINA |      1 |
| JOAO    |      1 |
| MAFRA   |      4 |
| MARCELO |      3 |
| MARIA   |      1 |
| VIVIANE |      6 |
| ZOE     |      2 |
+---------+--------+

-- ORDER BY COM JOIN
SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

+---------+------+-------------------+------+------------+------------+----------------+--------+
| NOME    | SEXO | E-MAIL            | TIPO | NUMERO     | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+------------+------------+----------------+--------+
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554   | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786   | CENTRO     | RIO DE JANEIRO | RJ     |
| ANALICE | F    | ANA1@GMAIL.COM    | CEL  | 9856585470 | PAULISTA   | COLOMBO        | SP     |
| ANALICE | F    | ANA1@GMAIL.COM    | CEL  | 9856585473 | PAULISTA   | COLOMBO        | SP     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565   | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675   | CASCADURA  | B. HORIZONTE   | MG     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809   | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978   | JARDINS    | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665   | LAPA       | SAO PAULO      | SP     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979   | COPACABANA | RIO DE JANEIRO | RJ     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768   | BOM RETIRO | CURITIBA       | PR     |
| FRAN    | F    | FRAN@GMAIL.COM    | CEL  | 9856585474 | PAULISTA   | COLOMBO        | PR     |
| FRAN    | F    | FRAN@GMAIL.COM    | CEL  | 9856585474 | PAULISTA   | COLOMBO        | PR     |
| JOAO    | M    | JOAO1@GMAIL.COM   | CEL  | 9856585478 | PAULISTA   | COLOMBO        | RS     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785   | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578   | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | CLIENTE SEM EMAIL | CEL  | 9856585477 | PAULISTA   | COLOMBO        | RN     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654   | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765   | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786   | CENTRO     | RIO DE JANEIRO | RJ     |
| LORENA  | F    | CLIENTE SEM EMAIL | COM  | 88965676   | CENTRO     | VITORIA        | ES     |
| LUCAS   | M    | LUCAS1@GMAIL.COM  | CEL  | 9856585471 | PAULISTA   | COLOMBO        | PR     |
| LUCAS   | M    | LUCAS1@GMAIL.COM  | CEL  | 9856585472 | PAULISTA   | COLOMBO        | PR     |
| MATT    | M    | MATT1@GMAIL.COM   | CEL  | 9856585476 | PAULISTA   | COLOMBO        | PR     |
| MATT    | M    | MATT1@GMAIL.COM   | CEL  | 9856585479 | PAULISTA   | COLOMBO        | PR     |
| PAULO   | M    | PAULO@GMAIL.COM   | CEL  | 9856585475 | PAULISTA   | COLOMBO        | RJ     |
+---------+------+-------------------+------+------------+------------+----------------+--------+