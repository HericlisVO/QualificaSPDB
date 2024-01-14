use relacionamentos;

-- INNER JOIN 
-- retornará os registros (tupla) que obedecam a uma regra de relacionamento 
-- definida pelo usuario

-- select * from tabela1 INNER JOIN tablea2  ON tabela1.pk = tabela2.fk
-- INNER pode ser omitida

select * from funcionarios INNER JOIN cargos ON cargos.car_id = funcionarios.car_id;

-- omitindo o INNER e dando apelidos nas tabelas
select * from funcionarios as f JOIN cargos as c ON c.car_id = f.car_id;
select fun_nome as 'Funcionarios',
		car_nome as 'Cargos' 
        
        from funcionarios f 
        JOIN cargos c ON c.car_id = f.car_id;

select fun_nome as 'Funcionarios',
		car_nome as 'Cargos' 
        
        from funcionarios f, cargos c 
        where c.car_id = f.car_id;
        

select fun_nome as 'Funcionarios',
		car_nome as 'Cargos' 
        
        from funcionarios f 
        LEFT JOIN cargos c ON c.car_id = f.car_id
        where car_nome is null ;
-- LEFT OUTER JOIN 
-- retornará os registros (tupla) que obedecam a uma regra de relacionamento 
-- definida pelo usuario e MAIS TODOS OS REGISTROS DA TABELA ESQUERDA

-- select * from tabela1 LEFT OUTER JOIN tablea2  ON tabela1.pk = tabela2.fk
-- OUTER pode ser omitida
select * from funcionarios LEFT OUTER JOIN cargos ON cargos.car_id = funcionarios.car_id;
select * from funcionarios AS f LEFT JOIN cargos as c ON c.car_id = f.car_id;

-- omitindo o OUTER e dando apelidos nas tabelas
select  fun_nome as 'Funcionarios',
		fun_salario as 'Salário', 
        car_nome as'Cargos' 
        
        from funcionarios as f  
        LEFT JOIN cargos as c ON c.car_id = f.car_id
		where car_nome ='Medico';-- ou is null se quiser um campo vazio
        
        
-- RIGHT OUTER JOIN 
-- retornará os registros (tupla) que obedecam a uma regra de relacionamento 
-- definida pelo usuario e MAIS TODOS OS REGISTROS DA TABELA DIREITA

-- select * from tabela1 RIGHT OUTER JOIN tablea2  ON tabela1.pk = tabela2.fk
-- OUTER pode ser omitida
select * from funcionarios RIGHT OUTER JOIN cargos ON cargos.car_id = funcionarios.car_id;
select * from funcionarios AS f RIGHT JOIN cargos as c ON c.car_id = f.car_id;

-- omitindo o OUTER e dando apelidos nas tabelas
select  fun_nome as 'Funcionarios',
		fun_salario as 'Salário', 
        car_nome as'Cargos' 
        
        from funcionarios as f  
        RIGHT JOIN cargos as c ON c.car_id = f.car_id;
		-- where car_nome ='Medico';-- ou is null se quiser um campo vazio



select  fun_nome as 'Funcionarios',
		fun_salario as 'Salário', 
        car_nome as'Cargos' 
        
        from funcionarios as f  
        LEFT JOIN cargos as c ON c.car_id = f.car_id
        
UNION -- ALL
	
select  fun_nome as 'Funcionarios',
		fun_salario as 'Salário', 
        car_nome as'Cargos' 
        
        from funcionarios as f  
        RIGHT JOIN cargos as c ON c.car_id = f.car_id
		order by  Cargos, Funcionarios;-- ou is null se quiser um campo vazio

