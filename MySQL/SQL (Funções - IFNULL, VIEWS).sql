USE DATABASE COMERCIO;
SHOW DATABASE;

+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| produto            |
| telefone           |
+--------------------+
SHOW TABLES;
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
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDPRODUTO | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | NO   |     | NULL    |                |
| VALOR     | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

-- IF NULL

SELECT C.NOME, C.EMAIL, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-------------------+--------+------------+
| NOME    | EMAIL             | ESTADO | NUMERO     |
+---------+-------------------+--------+------------+
| LUCAS   | LUCAS1@GMAIL.COM  | PR     | 9856585471 |
| LUCAS   | LUCAS1@GMAIL.COM  | PR     | 9856585472 |
| ANA     | ANA1@GMAIL.COM    | SP     | 9856585473 |
| ANA     | ANA1@GMAIL.COM    | SP     | 9856585470 |
| PAULO   | PAULO@GMAIL.COM   | RJ     | 9856585475 |
| MATT    | MATT1@GMAIL.COM   | PR     | 9856585476 |
| MATT    | MATT1@GMAIL.COM   | PR     | 9856585479 |
| FRAN    | FRAN@GMAIL.COM    | PR     | 9856585474 |
| FRAN    | FRAN@GMAIL.COM    | PR     | 9856585474 |
| JOAO    | JOAO1@GMAIL.COM   | RS     | 9856585478 |
| JORGE   | NULL              | RN     | 9856585477 |
| ANDRE   | ANDRE@GLOBO.COM   | MG     | 68976565   |
| ANDRE   | ANDRE@GLOBO.COM   | MG     | 99656675   |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 33567765   |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88668786   |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 55689654   |
| DANIELE | DANIELE@GMAIL.COM | RJ     | 88687979   |
| LORENA  | NULL              | ES     | 88965676   |
| ANTONIO | ANTONIO@IG.COM    | PR     | 89966809   |
| ANTONIO | ANTONIO@UOL.COM   | SP     | 88679978   |
| ELAINE  | ELAINE@GLOBO.COM  | PR     | 99655768   |
| CARMEM  | CARMEM@IG.COM     | SP     | 89955665   |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77455786   |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 89766554   |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 77755785   |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 44522578   |
+---------+-------------------+--------+------------+


SELECT C.NOME,
	   IFNULL(C.EMAIL, 'SEM EMAIL CADASTRADO') AS EMAIL,
	   E.ESTADO,
	   T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+----------------------+--------+------------+
| NOME    | EMAIL                | ESTADO | NUMERO     |
+---------+----------------------+--------+------------+
| LUCAS   | LUCAS1@GMAIL.COM     | PR     | 9856585471 |
| LUCAS   | LUCAS1@GMAIL.COM     | PR     | 9856585472 |
| ANA     | ANA1@GMAIL.COM       | SP     | 9856585473 |
| ANA     | ANA1@GMAIL.COM       | SP     | 9856585470 |
| PAULO   | PAULO@GMAIL.COM      | RJ     | 9856585475 |
| MATT    | MATT1@GMAIL.COM      | PR     | 9856585476 |
| MATT    | MATT1@GMAIL.COM      | PR     | 9856585479 |
| FRAN    | FRAN@GMAIL.COM       | PR     | 9856585474 |
| FRAN    | FRAN@GMAIL.COM       | PR     | 9856585474 |
| JOAO    | JOAO1@GMAIL.COM      | RS     | 9856585478 |
| JORGE   | SEM EMAIL CADASTRADO | RN     | 9856585477 |
| ANDRE   | ANDRE@GLOBO.COM      | MG     | 68976565   |
| ANDRE   | ANDRE@GLOBO.COM      | MG     | 99656675   |
| KARLA   | KARLA@GMAIL.COM      | RJ     | 33567765   |
| KARLA   | KARLA@GMAIL.COM      | RJ     | 88668786   |
| KARLA   | KARLA@GMAIL.COM      | RJ     | 55689654   |
| DANIELE | DANIELE@GMAIL.COM    | RJ     | 88687979   |
| LORENA  | SEM EMAIL CADASTRADO | ES     | 88965676   |
| ANTONIO | ANTONIO@IG.COM       | PR     | 89966809   |
| ANTONIO | ANTONIO@UOL.COM      | SP     | 88679978   |
| ELAINE  | ELAINE@GLOBO.COM     | PR     | 99655768   |
| CARMEM  | CARMEM@IG.COM        | SP     | 89955665   |
| ADRIANA | ADRIANA@GMAIL.COM    | RJ     | 77455786   |
| ADRIANA | ADRIANA@GMAIL.COM    | RJ     | 89766554   |
| JOICE   | JOICE@GMAIL.COM      | RJ     | 77755785   |
| JOICE   | JOICE@GMAIL.COM      | RJ     | 44522578   |
+---------+----------------------+--------+------------+