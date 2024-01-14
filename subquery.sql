/*
será "QUASE" sempre declarada dentro da clausula where como condição de filtro da consulta principal;
Note que se o subselect for executado sozinhi - somente ele rertonará o resultado escrito dentro da clausula where
ou seja:

select car_id from cargos where car_nome ='Medico' retornará 1
select * from funcionarios where car_id=(1);



*/

select * from funcionarios where car_id= -- (1);
		( select car_id from cargos where car_nome ='Medico'); -- subquery . Extremamente nescessária
       
select * from funcionarios;
        
select * from funcionarios order by fun_salario DESC limit 5;
        
select * from funcionarios where fun_salario = (select max(fun_salario) from funcionarios ) ;
select * from funcionarios where fun_salario =(10000);

-- ############################################

select  fun_id as 'Id', fun_nome as 'Funcionarios', fun_salario as 'Salario', (fun_salario *1.2) as 'Previsão 20%' 
		from funcionarios where car_id= (select car_id from cargos where car_nome ='Jornalista');
        
update funcionarios set fun_salario = (fun_salario *1.2)  where car_id= (select car_id from cargos where car_nome ='Jornalista');

delete from funcionarios where car_id = (select car_id from cargos where car_nome ='Jornalista' and fun_id = 9);


create table funcionario2 as select * from funcionarios;
create table funcionarios4 like funcionarios3;

 insert into funcionarios3 (select * from funcionarios);
desc funcionarios3;

select * from funcionarios3;