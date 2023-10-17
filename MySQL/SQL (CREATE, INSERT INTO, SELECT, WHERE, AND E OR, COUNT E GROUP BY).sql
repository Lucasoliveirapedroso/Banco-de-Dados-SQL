CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS (
	LIVRO VARCHAR(30),
	AUTOR VARCHAR(30),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT (10,2),
	UF CHAR(2),
	ANO INT(4)
);


INSERT INTO LIVROS VALUES ()

Livro	Autor	Sexo Numero de PAginas	Nome da Editora	Valor do Livro	UF da Editora	Ano da Publicacao

INSERT INTO LIVROS VALUES ('Cavaleiro Real', 'Ana Claudia','F', 465, 'Atlas', 49.9,	'RJ', 2009);
INSERT INTO LIVROS VALUES ('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 98, 'SP', 2018);
INSERT INTO LIVROS VALUES ('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45, 'RJ', 2008);
INSERT INTO LIVROS VALUES ('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018);
INSERT INTO LIVROS VALUES ('Habitos Saudáveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98, 'RJ', 2019);
INSERT INTO LIVROS VALUES ('A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60, 'MG', 2016);
INSERT INTO LIVROS VALUES ('Estacio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100, 'ES', 2015);
INSERT INTO LIVROS VALUES ('Pra sempre amigas', 'Leda Silva', 'F', 510, 'Insignia', 78.98, 'ES', 2011);
INSERT INTO LIVROS VALUES ('Copas Inesqueciveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2018);
INSERT INTO LIVROS VALUES ('O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58, 'SP', 2017);



1 – Trazer todos os dados.
SELECT * FROM LIVROS;

+---------------------+-------------------+------+---------+-------------+--------+------+------+
| LIVRO               | AUTOR             | SEXO | PAGINAS | EDITORA     | VALOR  | UF   | ANO  |
+---------------------+-------------------+------+---------+-------------+--------+------+------+
| Cavaleiro Real      | Ana Claudia       | F    |     465 | Atlas       |  49.90 | RJ   | 2009 |
| SQL para leigos     | João Nunes        | M    |     450 | Addison     |  98.00 | SP   | 2018 |
| Receitas Caseiras   | Celia Tavares     | F    |     210 | Atlas       |  45.00 | RJ   | 2008 |
| Pessoas Efetivas    | Eduardo Santos    | M    |     390 | Beta        |  78.99 | RJ   | 2018 |
| Habitos Saudáveis   | Eduardo Santos    | M    |     630 | Beta        | 150.98 | RJ   | 2019 |
| A Casa Marrom       | Hermes Macedo     | M    |     250 | Bubba       |  60.00 | MG   | 2016 |
| Estacio Querido     | Geraldo Francisco | M    |     310 | Insignia    | 100.00 | ES   | 2015 |
| Pra sempre amigas   | Leda Silva        | F    |     510 | Insignia    |  78.98 | ES   | 2011 |
| Copas Inesqueciveis | Marco Alcantara   | M    |     200 | Larson      | 130.98 | RS   | 2018 |
| O poder da mente    | Clara Mafra       | F    |     120 | Continental |  56.58 | SP   | 2017 |
+---------------------+-------------------+------+---------+-------------+--------+------+------+

2 – Trazer o nome do livro e o nome da editora
SELECT LIVRO, EDITORA FROM LIVROS; 

+---------------------+-------------+
| LIVRO               | EDITORA     |
+---------------------+-------------+
| Cavaleiro Real      | Atlas       |
| SQL para leigos     | Addison     |
| Receitas Caseiras   | Atlas       |
| Pessoas Efetivas    | Beta        |
| Habitos Saudáveis   | Beta        |
| A Casa Marrom       | Bubba       |
| Estacio Querido     | Insignia    |
| Pra sempre amigas   | Insignia    |
| Copas Inesqueciveis | Larson      |
| O poder da mente    | Continental |
+---------------------+-------------+

3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.
SELECT LIVRO, UF FROM LIVROS
WHERE SEXO = 'M';
	
+---------------------+------+
| LIVRO               | UF   |
+---------------------+------+
| SQL para leigos     | SP   |
| Pessoas Efetivas    | RJ   |
| Habitos Saudáveis   | RJ   |
| A Casa Marrom       | MG   |
| Estacio Querido     | ES   |
| Copas Inesqueciveis | RS   |
+---------------------+------+

4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.
SELECT LIVRO, PAGINAS FROM LIVROS
WHERE SEXO = 'F';

+-------------------+---------+
| LIVRO             | PAGINAS |
+-------------------+---------+
| Cavaleiro Real    |     465 |
| Receitas Caseiras |     210 |
| Pra sempre amigas |     510 |
| O poder da mente  |     120 |
+-------------------+---------+

5 – Trazer os valores dos livros das editoras de São Paulo.

SELECT LIVRO,VALOR FROM LIVROS
WHERE UF = 'SP';

+------------------+-------+
| LIVRO            | VALOR |
+------------------+-------+
| SQL para leigos  | 98.00 |
| O poder da mente | 56.58 |
+------------------+-------+


6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).

SELECT AUTOR, SEXO, UF FROM LIVROS
WHERE SEXO = 'M' 
AND UF = 'SP' 
OR UF ='RJ';

+----------------+------+------+
| AUTOR          | SEXO | UF   |
+----------------+------+------+
| Ana Claudia    | F    | RJ   |
| João Nunes     | M    | SP   |
| Celia Tavares  | F    | RJ   |
| Eduardo Santos | M    | RJ   |
| Eduardo Santos | M    | RJ   |
+----------------+------+------+

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE 
SEXO = 'M' AND (UF = 'SP' OR UF = 'RJ');

+----------------+------+------+
| AUTOR          | SEXO | UF   |
+----------------+------+------+
| João Nunes     | M    | SP   |
| Eduardo Santos | M    | RJ   |
| Eduardo Santos | M    | RJ   |
+----------------+------+------+

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE SEXO = 'M'
AND UF = 'SP'
AND paginas > 100;


+-------------+------+------+
| AUTOR       | SEXO | UF   |
+-------------+------+------+
| João Nunes  | M    | SP   |
+-------------+------+------+

--TODAS AS CONDIÇÕES PRECISAM SER VERDADEIRAS
	
	OR = OU 1 VERDADEIRO
	AND = E 2 VERDADEIRO
	
	
SELECT AUTOR, SEXO, UF FROM LIVROS
WHERE SEXO = 'M' 
AND UF = 'SP' OR UF ='RJ';	

+----------------+------+------+
| AUTOR          | SEXO | UF   |
+----------------+------+------+
| Ana Claudia    | F    | RJ   |
| João Nunes     | M    | SP   |
| Celia Tavares  | F    | RJ   |
| Eduardo Santos | M    | RJ   |
| Eduardo Santos | M    | RJ   |
+----------------+------+------+

--BUSCA FALSO 

SELECT AUTOR, SEXO, UF FROM LIVROS
WHERE SEXO = 'M' 
AND (UF = 'SP' OR UF ='RJ');

+----------------+------+------+
| AUTOR          | SEXO | UF   |
+----------------+------+------+
| João Nunes     | M    | SP   |
| Eduardo Santos | M    | RJ   |
| Eduardo Santos | M    | RJ   |
+----------------+------+------+

--BUSCA VERDADEIRO


FUNÇÃO COUNT 

SELECT COUNT(*) FROM LIVROS;
CONTA TUDO DA TABELA 

+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+


SELECT COUNT(*) AS "QUANTIDADE TOTAL DA TABELA CLIENTE" 
FROM LIVROS;

SELECT SEXO, COUNT(*)
FROM LIVROS
GROUP BY SEXO;

+------+----------+
| SEXO | COUNT(*) |
+------+----------+
| F    |        4 |
| M    |        6 |
+------+----------+