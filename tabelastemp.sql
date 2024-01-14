use relacionamentos;

create temporary table funcionarios_temp like funcionarios;
desc funcionarios_temp;


show tables;


create temporary table cargos like funcionarios;
select * from cargos;
create temporary table temp as select * from v_final;

select * from temp;


select * from temp where cargos = 'Radialista';
