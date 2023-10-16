
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

-- RELATORIO GERAL DE TODOS OS CLIENTE 

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

-- RELATORIOS DE HOMENS

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

--CORREÇÃO DE SEXO M PARA F
+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789  |
|        13 | LORENA  | M    | NULL              | 774557887 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763  |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+

SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (11, 12,13,17,18);

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE IN (11, 12,13,17,18); -- IN PODE SER UTILIZADO EM VEZ DE OR SE VARIOS ID


-- RELATORIOS DE MULHERES

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';

--CORREÇÃO DE F PARA M

+-----------+---------+------+----------------+-------------+
| IDCLIENTE | NOME    | SEXO | EMAIL          | CPF         |
+-----------+---------+------+----------------+-------------+
|         7 | JORGE   | F    | NULL           | 12345678917 |
|        15 | ANTONIO | F    | ANTONIO@IG.COM | 12436767    |
+-----------+---------+------+----------------+-------------+

SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (7, 15);

UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE IN (7,15); 

--QUANTIDADE DE HOMENS E MULHERES

SELECT COUNT(*) AS QUANTIDADE, SEXO
FROM CLIENTE 
GROUP BY SEXO;

+------------+------+
| QUANTIDADE | SEXO |
+------------+------+
|         10 | M    |
|         10 | F    |
+------------+------+

--ID E EMAIL DAS MULHERES QUE MORAM NO CENTRO DO RJ E NÃO TENHAM CELULARES

SELECT C.IDCLIENTE, C.NOME, C.EMAIL, C.SEXO, E.BAIRRO, E.ESTADO, T.TIPO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO'
AND ESTADO = 'RJ'
AND TIPO != 'CEL';


+-----------+---------+-------------------+------+--------+--------+------+
| IDCLIENTE | NOME    | EMAIL             | SEXO | BAIRRO | ESTADO | TIPO |
+-----------+---------+-------------------+------+--------+--------+------+
|        11 | KARLA   | KARLA@GMAIL.COM   | F    | CENTRO | RJ     | COM  |
|        19 | ADRIANA | ADRIANA@GMAIL.COM | F    | CENTRO | RJ     | RES  |
|        19 | ADRIANA | ADRIANA@GMAIL.COM | F    | CENTRO | RJ     | RES  |
|        20 | JOICE   | JOICE@GMAIL.COM   | F    | CENTRO | RJ     | RES  |
|        20 | JOICE   | JOICE@GMAIL.COM   | F    | CENTRO | RJ     | COM  |
+-----------+---------+-------------------+------+--------+--------+------+


-- CAMPANHA DE MKT QUER UMA LISTA COM NOME, EMAIL, TELEFONE CELULAR QUE MORAM NO RJ 

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE TIPO = 'CEL'
AND ESTADO = 'RJ';

+-------+-----------------+------------+
| NOME  | EMAIL           | CELULAR    |
+-------+-----------------+------------+
| PAULO | PAULO@GMAIL.COM | 9856585475 |
| KARLA | KARLA@GMAIL.COM | 33567765   |
| KARLA | KARLA@GMAIL.COM | 88668786   |
+-------+-----------------+------------+


-- CAMPANHA DE MKT QUER UMA LISTA COM NOME, EMAIL, TELEFONE CELULAR DAS MULHRES QUE MORAM EM SP

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP';

+--------+----------------+------------+
| NOME   | EMAIL          | CELULAR    |
+--------+----------------+------------+
| ANA    | ANA1@GMAIL.COM | 9856585473 |
| ANA    | ANA1@GMAIL.COM | 9856585470 |
| CARMEM | CARMEM@IG.COM  | 89955665   |
+--------+----------------+------------+
