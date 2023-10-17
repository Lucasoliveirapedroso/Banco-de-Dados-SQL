create database exercicio;

use exercicio;

create table funcionarios
  (
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
  );
  
  
 EX 1
 SELECT DEPARTAMENTO, COUNT(*) 
 FROM FUNCIONARIOS
 GROUP BY DEPARTAMENTO
 ORDER BY 1; ORDENA PRIMEIRA COLUNA
 
 
SELECT * 	
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = "Roupas" 
OR DEPARTAMENTO = "Filmes";


sempre colocar na primeira instancia quem tem mais chanche de primeira saida 
numero maior de registro



SELECT COUNT(*), SEXO 
FROM FUNCIONARIOS
GROUP BY SEXO;


LAR  52 
FILMES 21

SELECT *
FROM FUNCIONARIOS
WHERE 
SEXO = 'MASCULINO' OR 
DEPARTAMENTO = 'JARDIM';


FILTRAR NULL

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CPF IS NULL;

AO FILTRAR NULL SEMPRE UTILIZAR IS NUNCA =, IS NOT NULL NÃO NULO


/* PERFORMANCE EM OPERADORES LOGICOS */

/* 1 MILHAO DE REGISTROS

PARA CONTAR
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

CONDICAO
SEXO = F
CIDADE = RIO DE JANEIRO

SITUACAO - TRATANDO COM OU / OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = 'F'
OR CIDADE = 'RIO DE JANEIRO';

SITUACAO - TRATANDO COM E / AND
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F';


/* exercicio */

/* Considerando o que vc aprendeu sobre performance, resolva os exercicios abaixo */

SELECT COUNT(*) FROM FUNCIONARIOS;

--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

-- 21 | Filmes   53 | Roupas

--Como estamos trabalhando com OR e a segunda condicao é opcional
--colocamos na primeira condicao quem tem mais chances de uma saida
--verdadeira, pois a segunda condicao nao será checada nesse caso.

select * from funcionarios
where departamento = 'Roupas'
or
departamento = 'Filmes';

SELECT COUNT(*), departamento
FROM FUNCIONARIOS
group by departamento;

SELECT COUNT(*), departamento
FROM FUNCIONARIOS
group by departamento
order by 1;

WHERE DEPARTAMENTO = 'Filmes' OR DEPARTAMENTO = 'Roupas'

--O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
--de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
--desses dois setores. OR +  AND *

--Feminino 491 ocorrencias
select count(*), sexo
from funcionarios
group by sexo;

--52 | Lar  21 Filmes
select count(*), departamento
from funcionarios
group by departamento;

SELECT * FROM FUNCIONARIOS
WHERE
( DEPARTAMENTO = 'Lar' AND SEXO = 'Feminino' )
OR
( DEPARTAMENTO = 'Filmes' AND SEXO = 'Feminino' );

--Traga os funcionarios do sexo masculino
--ou os funcionarios que trabalhem no setor Jardim

SELECT * FROM FUNCIONARIOS
WHERE
SEXO = 'Masculino' OR
DEPARTAMENTO = 'Jardim';

