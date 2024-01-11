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

--EXERCICIOS 
-- VENDEDOR QUE VENDEU MENOS EM MARCO E SEU NOME

SELECT NOME, MIN(MARCO) AS MENOR_VENDAS_MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

+-------+--------------------+
| NOME  | MENOR_VENDAS_MARCO |
+-------+--------------------+
| MESSI |            1254.54 |
+-------+--------------------+

-- VENDEDOR QUE MAIS VENDEU EM MARCO

SELECT NOME, MAX(MARCO) AS MAIOR_VENDAS_MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

+---------+--------------------+
| NOME    | MAIOR_VENDAS_MARCO |
+---------+--------------------+
| LARISSA |            9854.54 |
+---------+--------------------+

-- QUEM MAIS VENDEU MAIS QUE O VALOR MEDIO DE FEVEREIRO

SELECT AVG(FEVEREITO) AS MEDIA_VENDAS_FEVERIRO FROM VENDEDORES;

+-----------------------+
| MEDIA_VENDAS_FEVERIRO |
+-----------------------+
|          17775.636004 |
+-----------------------+

SELECT NOME, FEVEREITO AS ACIMA_MEDIAS_VENDAS_FEVEREIRO
FROM VENDEDORES
WHERE FEVEREITO > (SELECT AVG(FEVEREITO) FROM VENDEDORES);

+------+-------------------------------+
| NOME | ACIMA_MEDIAS_VENDAS_FEVEREIRO |
+------+-------------------------------+
| KANE |                      93145.35 |
+------+-------------------------------+


-- MENOS QUE A MEDIA


SELECT NOME, FEVEREITO AS ACIMA_MEDIAS_VENDAS_FEVEREIRO
FROM VENDEDORES
WHERE FEVEREITO < (SELECT AVG(FEVEREITO) FROM VENDEDORES);

+---------+-------------------------------+
| NOME    | ACIMA_MEDIAS_VENDAS_FEVEREIRO |
+---------+-------------------------------+
| LUCAS   |                       7518.35 |
| MARIA   |                       5371.35 |
| SON     |                       3912.35 |
| RONALDO |                       6487.35 |
| MESSI   |                       6542.35 |
| LARISSA |                       1452.35 |
+---------+-------------------------------+

