use relacionamentos;
start transaction;

select * from funcionarios;

update funcionarios set fun_salario = fun_salario* 1.2;

rollback;
commit;