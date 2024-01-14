use relacionamentos;

select * from funcionarios;

SELECT 
    fun_nome AS 'Funcionarios',
    
    CASE 
        WHEN car_nome is null then 'Não Definido'
        WHEN car_nome is not null then car_nome 
        
    END AS 'Cargo'
FROM
    funcionarios f left join cargos c on f.car_id =c.car_id;
    
    
    
SELECT 
    fun_nome AS 'Funcionarios',
    CASE
        WHEN fun_salario >= 30000 THEN CONCAT(' Salario Super Alto: ', round( fun_salario, 2 ))
        WHEN
            fun_salario >= 10000
                AND fun_salario < 30000
        THEN
            CONCAT(' Salario Alto:  ', round(fun_salario), 2)
        WHEN
            (fun_salario >= 5000
                AND fun_salario < 100000)
        THEN
            CONCAT(' Salario Medio:  ',round( fun_salario, 2))
        WHEN fun_salario < 5000 THEN CONCAT(' Salario Baixo:  ', round( fun_salario,2 ) )
        ELSE 'Não informado!'
    END AS 'Salario'
FROM
    funcionarios f
        LEFT JOIN
    cargos c ON f.car_id = c.car_id;
