create database relacionamentos;

use relacionamentos;
drop table funcionarios;
drop table conjuges;

create table funcionarios (
				fun_id int auto_increment,
				fun_nome varchar(100),
                fun_sexo enum('m','f') not null default 'm',
                fun_salario decimal(10.2),
                car_id int,
                primary key(fun_id),
                foreign key (car_id) references cargos(car_id)
                );
desc funcionarios;
truncate  funcionarios;

insert into funcionarios (fun_nome, fun_salario, car_id) 
					values 
					('Luis Melodia', 6500.00,2),
					('Luis Airao', 7850.00,4),
					('Luis Airao', 7850.00,4),
					('Luis Tatit', 32680.00,2),
					('Marcos de Barros', 9854.00,1),
					('Elton Soares', 1234.00,2),
					('Milton Cruz', 8521.00,4),
					('Sandro Bueno', 3578.00,2),
					('Luan Souza', 3578.00,4),
					('Sandro Bueno', 3578.00,2),
					('Marilia Mendonça', 3578.00,2),
					('Berenice Merlin', 3578.00,1),
					('Rodrigo Selmo', 3578.00,1),
					('Ricardo Rodrigues', 3578.00,1),
					('Walmir Belsario', 3578.00,4),
					('Lia Andrade', 3578.00,1),
					('Luis Ricardo', 3578.00,null),
					('Ricardo Silva', null, null),
					('Mauricio Sales', 3578.00,1),
					('Mari Santana', 3578.00,null),
					('Ivan Naciso', 4415.00,1),
					('Pitucho O Felino', 4415.00,null)
                    ;
         
-- cruzando tableas com CROSS JOIN

select * 
		from funcionarios CROSS JOIN cargos;

-- select * from tabela1 CROSS JOIN tabela2
-- CRROS 	é opcional e pode ser omitida
select * 
		from funcionarios JOIN cargos;

create table cargos (
			car_id int auto_increment,
            car_nome varchar(100),
            primary key(car_id)

);
insert into cargos(car_nome) values ('Programador');
desc cargos;
drop table cargos;
select * from cargos;


create table treinamentos (
					trei_id int auto_increment,
                    trei_nome varchar(100) not null,
                    
                    primary key(trei_id)
                    );
                    
insert into treinamentos (trei_nome) values('Excell'),('Mysql'),('Project');

drop table treinamentos;
desc treinamentos;

select * from treinamentos;

-- tabela de ligação

create table fun_trei(
				fun_id int,
				trei_id int,
                primary key (fun_id, trei_id),
                foreign key(fun_id) references funcionarios(fun_id),
                foreign key(trei_id) references treinamentos(trei_id)
);

drop table fun_trei;
insert into fun_trei values (1,2),(1,3),(2,1),(2,2),(2,3),(1,1);

desc fun_trei;

select * from fun_trei;