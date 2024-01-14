use relacionamentos;

select * from funcionarios;

 create or replace view v_funcionarios as
 SELECT  
	fun_id,
    fun_nome AS 'Nome',
case    fun_sexo

	when 'm' then 'Masculino'
	when 'f' then 'Feminino'

	end as 'Sexo',
    fun_salario 'Salario',
    car_nome AS 'Cargos'
FROM
    funcionarios f
        LEFT JOIN
    cargos c ON f.car_id = c.car_id;
    
select Nome, 
case Sexo
when 'm' then 'Masculino'
when 'f' then 'Feminino'
end as 'Caso Sexo'
 from v_funcionario;
 
 
 show databases;
 use information_schema;
 show tables;
 
 show create view v_funcionarios;
 select * from v_funcionarios;
 select * from views;
 
 alter view v_funcionarios as
	SELECT  
    fun_id,
    fun_nome AS 'Nome',
    fun_sexo AS 'Sexo',
    fun_salario 'Salario',
    car_nome AS 'Cargos'
FROM
    funcionarios f
        LEFT JOIN
    cargos c ON f.car_id = c.car_id;
			
drop view v_funcionario;


create or replace view v_final as 
select 	
		fun_id,
		Nome, 
	   Sexo,
		replace(
       replace(
       replace(
       format (Salario,2)
					,'.','@')
                    ,',','.')
					,'@','.') as Salario,
       Cargos
       from  v_funcionarios

;

select * from v_final;

select * from v_funcionarios;

-- descontinuado Workbench 8. Error Code: 1288. The target table v_funcionarios of the UPDATE is not updatable
update v_funcionarios set Nome = 'Lucas de Aguas' where fun_id =4;


