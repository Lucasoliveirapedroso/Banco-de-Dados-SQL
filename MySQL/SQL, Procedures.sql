--Procedures 

CREATE DATABASE PROJETO1;

USE PROJETO1;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES(NULL,'JAVA',30,500.00);
INSERT INTO CURSOS VALUES(NULL,'FUNDAMENTOS DE BANCOS DE DADOS',40,700.00);

SELECT * FROM CURSOS;

DELIMITER $

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),
					       P_HORAS INT (30),
					       P_PRECO FLOAT(10,2))
BEGIN

	INSERT INTO CURSOS VALUES(NULL, P_NOME, P_HORAS, P_PRECO);

END
$

--CHAMANDO A PROCEDURE

CALL CAD_CURSO('SQL SERVER', 35, 1000.00);
CALL CAD_CURSO('ORACLE', 30, 1300.00);
CALL CAD_CURSO('MYSQL', 20, 400.00);

CALL CAD_CURSO('AZURE', 35, 1000.00);
CALL CAD_CURSO('AWS', 30, 1300.00);
CALL CAD_CURSO('POWER BI', 20, 400.00);

--criação de uma query de consulta.

DELIMITER $

CREATE PROCEDURE CONSULTA_CURSO()

BEGIN
	SELECT * FROM CURSOS; -- SEM PARAMETROS
END
$ 

DELIMITER ;

CALL CONSULTA_CURSO;

+---------+--------------------------------+-------+---------+
| IDCURSO | NOME                           | HORAS | VALOR   |
+---------+--------------------------------+-------+---------+
|       1 | JAVA                           |    30 |  500.00 |
|       2 | FUNDAMENTOS DE BANCOS DE DADOS |    40 |  700.00 |
|       3 | SQL SERVER                     |    35 | 1000.00 |
|       4 | ORACLE                         |    30 | 1300.00 |
|       5 | MYSQL                          |    20 |  400.00 |
|       6 | AZURE                          |    35 | 1000.00 |
|       7 | AWS                            |    30 | 1300.00 |
|       8 | POWER BI                       |    20 |  400.00 |
+---------+--------------------------------+-------+---------+

-- CASO ID

DELIMITER #

CREATE PROCEDURE LE_CURSO( P_IDCURSO INT )

BEGIN
	SELECT NOME, HORAS, VALOR FROM CURSOS
    WHERE IDCURSO =  P_IDCURSO;
END
#

DELIMITER ;

CALL LE_CURSO(2);

+--------------------------------+-------+--------+
| NOME                           | HORAS | VALOR  |
+--------------------------------+-------+--------+
| FUNDAMENTOS DE BANCOS DE DADOS |    40 | 700.00 |
+--------------------------------+-------+--------+