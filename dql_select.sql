describe clientes;
select * from clientes;

insert into clientes values 
					(null,'Hericlis Ventura','m','sp','1998-11-03'),
                    (null,'Gessyca Padilha','f','sp','1991-03-25'),
                    (null,'Elina Aparecida','f','sp','1980-06-11'),
                    (null,'José Carlos','m','sp','19951203'),
                    (null,'Manoel Carlos','m','sp','1998@08@15'),
                    (null,'João Antonio','m','rj','1997-05-23'),
                    (null,'Antonio Marcos','m','sp','1996-09-16'),
                    (null,'Nilvan','m','sc','2002-09-11'),
                    (null,'Anastacia','f','sp','2001-08-07-23'),
                    (null,'Manuela','f','sc','1998-09-18'),
                    (null,'Vania','f','sp','2001-08-14'),
                    (null,'Marian','f','mg','2007-10-28'),
                    (null,'João Firmino','m','pr','1998-01-07'),
                    (null,'Antonieta','f','mg','2007-06-30'),
                    (null,'Stevan ventura','m','sp','1998-05-22'),
                    (null,'João Anisio','m','pr','2003-10-06'),
                    (null,'Juan','m','sp','2005-03-13'),
                    (null,'Miria','f','mg','2003-12-05'),
                    (null,'Tania','f','rj','2000-07-12');
                    
-- DQL - DATA QUERY LANGUAGE - SELECT

-- um select simples
select * from clientes; 

-- select escolhendo campos

select nomeCliente, dataNascimento from clientes;
select nomeCliente, nomeCliente, dataNascimento from clientes;
select dataNascimento, nomeCliente, nomeCliente from clientes;
select *, dataNascimento from clientes;

-- select dataNascimento, * from clientes; - Não Funciona!!!

-- select utilizando apelido para as colunas
--  O 'as' pode ser omitido porém boas práticas pedem o 'as'
-- assim como as aspas no apelido, também podem ser omitidos, a não ser que seja composto
select nomeCliente 'Nome do Cliente', dataNascimento 'Nascimento' from clientes;

-- select com colunas falsas
select nomeCliente as 'Nome do Cliente', dataNascimento as 'Nascimento', idCliente *100 as Salario from clientes;

select nomeCliente as 'Nome do Cliente', dataNascimento as 'Nascimento', idCliente *100 as Salario, 'Brasileiro' as Nacionalidade from clientes;

-- ordenação
-- maior ladrão de performace do sistema

select * from clientes order by ufNascimento;

select * from clientes order by ufNascimento, dataNascimento;
select * from clientes order by ufNascimento DESC, dataNascimento DESC;
select * from clientes order by ufNascimento ASC, dataNascimento DESC;
select * from clientes order by 4 ASC, 5 DESC;

select nomeCliente as 'Nome do Cliente', 
dataNascimento as 'Nascimento', 
idCliente *100 as Salario, 'Brasileiro' as Nacionalidade 
from clientes order by Nascimento;

select * from clientes limit 3; -- 3 primeiras linhas
select * from clientes limit 0,3; -- 3 primeiras linhas
select * from clientes limit 3,3; -- 4,5,6
select * from clientes limit 4,10; -- 5,6,7,8,9,10


-- clausula where

-- operadores de comparação
 use empresa;
 
select *from clientes where idCliente =30;

select *from clientes where ufNascimento ='rj';
select *from clientes where ufNascimento !='rj';

select *from clientes where idCliente >10;
select *from clientes where idCliente >=10;
select *from clientes where idCliente < 10;
select *from clientes where idCliente <= 10;

-- Operadores lógicos

select * from clientes where idCliente >10 AND ufNascimento <> 'sp';
select * from clientes where idCliente <10 OR ufNascimento <> 'sp';

-- clausula between

select * from clientes where idCliente >=5 and idCliente <=45;
select * from clientes where idCliente between 5 and 40;

select * from clientes where idCliente <=5 or idCliente >40;
select * from clientes where idCliente not between 5 and 40;

-- clausula in

select *  from clientes where idCliente = 5 OR idCliente = 10 OR idCliente =20;
select * from clientes where idCliente in (5,10,20);

select *  from clientes where idCliente <> 5 and idCliente <> 10 and idCliente <> 20;
select * from clientes where idCliente  not in (5,10,20);


-- Distinct

select ufNascimento from clientes;
select distinct ufNascimento from clientes;

-- like

select * from clientes where nomeCliente = 'Nilvan';
select * from clientes where nomeCliente like 'an%';-- começa com 
select * from clientes where nomeCliente like '%an'; -- termina com
select * from clientes where nomeCliente like '%an%'; -- contem 
select * from clientes where nomeCliente  not like '%an%'; -- não contem

select * from clientes where nomeCliente like 'an%to%t%';-- começa com 










								

								