use relacionamentos;
describe relacionamentos;
describe funcionarios;


-- descontinuado select fun_nome, max(fun_salario) from funcionarios;
select * from funcionarios;

SELECT 
     SUM(fun_salario)
FROM
    funcionarios
;

 -- selecionando os maiores salarios
SELECT 
    fun_nome, MAX(fun_salario  ) 
FROM
    funcionarios
GROUP BY fun_nome
HAVING MAX(fun_salario >= 10000) limit 3 ;

-- selecionando os salarios menores
SELECT 
    fun_nome, fun_salario, MIN(fun_salario)
FROM
    funcionarios
GROUP BY fun_nome , fun_salario
HAVING MIN(fun_salario <= 10000) limit 10
;

