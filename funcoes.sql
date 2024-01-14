-- funçoes 

select  round(123457.255);
select  round(123457.255, 2);
select  cast(123457.255  as char);

select cast(round(1234567, 2) as char);

-- indentação 
select cast(
			round(
				1234567.5585
            , 2) 
		as char);

-- ############################

select concat(
			cast(10 as char)
		,'e','20');
			
-- correção implicita 
select ('10'+'20');


-- replace function

select replace('MySql não é muito legal', 'não é', 'é ');

select 
		concat('R$ ',
		replace(
			cast(
			round(
			23456.7654
            ,2)
            as char)
			,'.',',')
) as 'Preço: '
;

select ('Impacta Online');
select right('Impacta Online',6);
select left('Impacta Online',7);
select substring('Impacta Online',9);
select substring('Impacta Online',-6);

-- usando trim

select ('                                  Impacta                         ') as 'oi'; -- sem trim
select trim('                                  Impacta                         ') as 'oi'; -- com trim
-- trim left e right

select ltrim('                                  Impacta                         ') as 'oi'; -- com trim
select rtrim('                                  Impacta                         ') as 'oi'; -- com trim


select upper('ImPaCTa');
select ucase('ImPaCTa');
select lower('ImPaCTa');
select lcase('ImPaCTa');


use empresa;

select lcase(nomeCLiente), ucase( ufNascimento) from clientes;

/*
strings 
https://dev.mysql.com/doc/refman/5.7/en/string-functions.html

data
https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html

*/
select date_format(now(),'%d/%m/%Y' ) as 'Data de hoje: ';
select date_format(dataNascimento ,'%d/%m/%Y' ) as 'Data de Nascimento' from clientes;
select * from clientes where year(dataNascimento )>= 2000 and month(dataNascimento ) = 10;

select * from cargos;
select group_concat(car_nome) from cargos;


select count(car_nome) from cargos;
select count(fun_nome) from funcionarios;
select count(car_id) from funcionarios;
select count(fun_salario), sum(fun_salario), avg(fun_salario) from funcionarios;
select fun_nome, count(fun_salario), sum(fun_salario), avg(fun_salario) from funcionarios group by fun_nome;

SELECT 
    COUNT(fun_nome), car_id
FROM
    funcionarios
GROUP BY car_id WITH ROLLUP;

SELECT 
    car_nome AS 'Categoria',
    GROUP_CONCAT(fun_nome) AS 'Funcionarios',
    SUM(fun_salario) AS 'Salarios'
FROM
    funcionarios f
        LEFT JOIN
    cargos c ON f.car_id = c.car_id
GROUP BY car_nome WITH ROLLUP;
select*from funcionarios;

SELECT 
    car_nome AS 'Categoria',
    GROUP_CONCAT(fun_nome) AS 'Funcionarios',
    SUM(fun_salario) AS 'Salarios'
FROM
    funcionarios f
        LEFT JOIN
    cargos c ON f.car_id = c.car_id
GROUP BY car_nome 
union
 select 'TOTAL',
			'---------',
            sum(fun_salario)
            from funcionarios f;		
;SELECT 
    car_nome AS 'Categoria',
    GROUP_CONCAT(fun_nome) AS 'Funcionarios',
    SUM(fun_salario) AS 'Salarios'
FROM
    funcionarios f
        LEFT JOIN
    cargos c ON f.car_id = c.car_id
GROUP BY car_nome 
having sum(fun_salario) >= 30000;
select*from funcionarios;
