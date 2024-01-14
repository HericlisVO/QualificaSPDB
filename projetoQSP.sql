
-- criando o banco de dados cds
create schema db_cds;
-- usando o banco de dados no sgbd
use db_cds;
-- tabela funcionarios
create table funcionarios
(
		cod_func int not null auto_increment,
		nome_func varchar(100) not null,
		end_func varchar(200) not null,
		sal_func decimal(10.2) not null default 0,
		sexo_func char(1) not null default 'f',

		constraint pk_func primary key (cod_func),
		constraint ch_func_1 check (sal_func >=0),
		constraint ch_func_2 check (sexo_func in ('f','m'))
);
 
desc funcionarios;

-- dados tabela funcionarios 
insert into funcionarios 
						values 
                        (null, 'vania gabriela pereira','rua a',2500.00,'f'),
                        (null, 'noberto pereira da silva','rua b',2300.00,'m'),
                        (null, 'olavo linhares','rua c',2580.00,'m'),
                        (null, 'paula da silva','rua d',3000.00,'f'),
                        (null, 'rolando rocha','rua e',2000.00,'m'); 
 
 -- Tabela Dependentes
 
 create table dependentes (
		cod_dep int not null auto_increment,
        cod_func int not null,
        nome_dep varchar(100) not null,
        sexo_dep char(1) not null default'm',
        -- restrição completa de nivel de tabela
        constraint pk_dep primary key (cod_dep),
        
        constraint fk_dep foreign key (cod_func) references funcionarios( cod_func),
        
        constraint ch_dep check(sexo_dep in('f','m'))
 
 );
                        
  -- dados tabela dependentes
  
  insert dependentes values
					(null,1,'ana pereira','f'),
					(null,1,'roberto pereira','m'),
					(null,1,'celso pereira','m'),
					(null,3,'brisa linhares','f'),
					(null,3,'mari sol linhares','f'),
					(null,4,'sonia da silva','f');
                        
-- tabela estado

create table estados 
(
		sigla_est char(2) not null,
        nome_est char(50) not null,
        
        constraint pk_est primary key(sigla_est),
        constraint uq_est unique(nome_est)

);

-- dados tabela estados
insert estados values
					('sp','são paulo'),
                    ('mg','minas gerais'),
					('rj','rio de janeiro');
					
 -- tabela cidade                   
create table cidades 
(

		cod_cid int not null auto_increment,
		sigla_est char(2) not null,
        nome_cid varchar(100) not null,
        
        constraint pk_cid primary key (cod_cid),
        constraint fk_cid foreign key (sigla_est) references estados(sigla_est)
);


-- dados tabela cidades

insert cidades values 
					(null, 'sp','são paulo'),
					(null, 'sp','sorocaba'),
					(null, 'sp','jundiaí'),
					(null, 'sp','americana'),
					(null, 'sp','araraquara'),
					(null, 'mg','ouro preto'),
					(null, 'rj','cachoeiro do itapemirim');


-- tabela cliente

create table clientes
(
		cod_cli int not null auto_increment,
        cod_cid int not null,
        nome_cli varchar(100) not null,
        end_cli varchar(100) not null,
        renda_cli decimal(10.2) not null default 0,
        sexo_cli char(1) not  null default 'f',
        
        constraint pk_cli primary key(cod_cli),
        constraint fk_cli foreign key(cod_cid) references cidades(cod_cid),
        constraint ch_cli_1 check (renda_cli>=0),
        constraint ch_cli_2 check(sexo_cli in ('f','m'))
		
);

-- dados tabela

insert clientes values
					(null,1,'josé nogueira','rua a',1500.00,'m'),
					(null,1,'angelo pereira','rua b',2000.00,'m'),
					(null,1,'além mar paranhos','rua c',1500.00,'f'),
					(null,1,'catarina souza','rua d',892.00,'f'),
					(null,1,'vagner costa','rua e',950.00,'m'),
					(null,2,'antenor da costa','rua f',1582.00,'m'),
					(null,2,'maria amélia de souza','rua g',1152.02,'f'),
					(null,2,'paulo roberto da silva','rua h',3250.00,'m'),
					(null,3,'fatima de souza','rua i',1632.00,'f'),
					(null,3,'joel da rocha','rua j',2000,'m');
-- tabela conjuges

create table conjuges 
(
		cod_cli int not null,
        nome_conj varchar(100) not null,
        renda_conj decimal(10.2) not null default 0,
        sexo_conj char(1) not null default 'm',
        
        constraint pk_conj primary key (cod_cli),
        constraint fk_conj foreign key (cod_cli) references clientes (cod_cli),
        constraint ch_conj_1 check (renda_conj >=0),
        constraint ch_conj_2 check (sexo_conj in ('f','m'))
        
);

-- dados tabela conjuge
insert conjuges values 
				(1,'carla nogueira',2500.00,'f'),
				(2,'emilia pereira',5500.00,'f'),
				(6,'altiva da costa',3000.00,'f'),
				(7,'carlos de souza',3250.00,'m');
                
                
-- tabela artistas
create table artistas (
			cod_art int not null auto_increment,
            nome_art varchar(100) not null,
            -- reduzida a nivel de tabela
            primary key (cod_art),
            unique(nome_art)
);

insert artistas values 
					(null, 'marisa monte'),
					(null, 'Baby do Brasil'),
					(null, 'Morais moreira'),
					(null, 'Pepeu Gomes'),
					(null, 'Paulinho Boca de Cantor'),
					(null, 'Luiz Galvão'),
					(null, 'Alceu Valença'),
					(null, 'Geral Azevedo'),
					(null, 'Elba Ramalho'),
					(null, 'Carlinhos Brown'),
					(null, 'Arnaldo Antunes'),
					(null, 'Adriana Calcanhoto'),
					(null, 'Aline Barros'),
					(null, 'Gal Costa'),
					(null, 'Chico Buarque'),
					(null, 'Rita Lee'),
					(null, 'Skank'),
					(null, 'Lulu Santos'),
					(null, 'Anitta');
      -- tabela gravadora              
create table gravadoras (
		-- nivel coluna
		cod_grav int not null auto_increment primary key,
        nome_grav varchar(100) unique not null    

);

-- dados gravadora

insert gravadoras values 
					(null, 'Phonomotor'),
					(null, 'Biscoito Fino'),
					(null, 'som livre'),
					(null, 'sony music'),
					(null, 'Universal'),
					(null, 'Emi');
-- tabela categorias
create table categorias (
		cod_cat int not null auto_increment,
        nome_cat varchar(50) not null,
        
        constraint pk_cat primary key (cod_cat),
        constraint uq_cat unique(nome_cat)
);

-- dados tabela categorias

insert categorias values
					(null, 'mpb'),
					(null, 'trilha sonora'),
					(null, 'Gospel'),
					(null, 'rock nacional');

-- tabela titulos
create  table titulos(
		cod_tit int auto_increment primary key,
        cod_cat int not null,
        cod_grav int not null,
        nome_cd varchar(100) unique not null,
        val_compra decimal(10.2) not null,
        val_cd decimal(10.2)not null,
        qtd_estq int not null,
        constraint fk_tit_1 foreign key(cod_cat) references categorias(cod_cat),
        constraint fk_tit_2 foreign key(cod_grav) references gravadoras(cod_grav),
        constraint ch_tit_1 check(val_cd >=0),
        constraint ch_tit_2 check(qtd_estq >=0)

);
-- dados tabela titulos

insert  titulos values
					(null,1, 1, 'tribalistas',30.00, 150.00, 1500),
					(null,1, 3, 'Acabou Chorare Novos Baianos se Encontram',50.00, 200.00, 500),
					(null,1, 4, 'O GRANDE ENCONTRO',60.00, 120.00, 1000),
					(null,1, 2, 'Estratoferica',50.00, 70.00, 2000),
					(null,1, 2, 'A Caravana',55.00, 98.00, 500),
					(null,1, 4, 'Loucura',30.00, 300.00, 200),
					(null,1, 4, 'Graça extraordinaria',20.00, 250.00, 100),
					(null,1, 2, 'Reza',30.00, 130.00, 300),
					(null,1, 5, 'Recanto',30.00, 90.00, 500),
					(null,1, 6, 'Oque Você Quer Saber de Verdade',30.00, 180.00, 500);
                    
-- tabela titulo artistas
create table titulos_artistas(
		cod_tit int not null,
        cod_art int not null,
        
        constraint pk_titart primary key(cod_tit, cod_art),
        constraint fk1_titart foreign key (cod_tit) references titulos(cod_tit),
        constraint fk2_titart foreign key (cod_art) references artistas(cod_art)

);

-- dados da tabela titulos artistas

insert titulos_artistas values 
							(1,1),
							(1,10),
							(1,11),
							(2,2),
							(2,3),
							(2,4),
							(2,5),
							(2,6),
							(3,7),
							(3,8),
							(3,9),
							(4,14),
							(5,15),
							(6,12),
							(7,13),
							(8,16),
							(9,14),
							(10,1);
                            
-- tabela pedido

create table pedidos(

		num_ped int not null primary key auto_increment,
		cod_cli int not null,
        cod_func int not null,
        data_ped datetime not null,
        constraint fk_ped_1 foreign key(cod_cli) references clientes(cod_cli),
        constraint fk_ped_2 foreign key(cod_func) references funcionarios(cod_func)

);


-- dados tabela pedido
drop table pedidos;

insert pedidos values 
					(null,1,2,'2012/05/02'),
					(null,3,4,'2012/05/02'),
					(null,4,5,'2012/06/02'),
					(null,1,4,'2013/03/02'),
					(null,7,5,'2013/03/02'),
					(null,4,4,'2013/03/02'),
					(null,5,5,'2013/03/02'),
					(null,8,2,'2013/03/02'),
					(null,2,2,'2013/03/02'),
					(null,7,1,'2013/03/02');
                    
                    
create table titulos_pedidos (
		num_ped int not null,
        cod_tit int not null,
        qtd_cd int not null,
        val_cd decimal(10,2) not null,
        
        constraint pk_titped primary key(num_ped,cod_tit),
        constraint fk_titped_4 foreign key(cod_tit) references titulos(cod_tit),
        constraint fk_titped_3 foreign key(num_ped) references pedidos(num_ped),
        constraint ch_titped_2 check(qtd_cd >=1),
        constraint ch_titped_3 check(val_cd >=0)

);
drop table titulos_pedidos; 
insert titulos_pedidos values
						(1,1,2,150.00),
						(1,2,3,200.00),
						(2,1,1,150.00),
						(2,2,3,2000.00),
						(3,1,2,150.00),
						(4,2,3,200.00),
						(5,1,2,150.00),
						(6,2,3,200.00),
						(6,3,1,120.00),
						(7,4,2,70.00),
						(8,1,4,150.00),
						(9,2,3,200.00),
						(10,7,2,250.00);

select * from funcionarios;
select * from dependentes;
select * from estados;
select * from cidades;
select * from clientes;
select * from conjuges;
select * from artistas;
select * from gravadoras;
select * from categorias;
select * from titulos;
select * from titulos_artistas;
select * from pedidos;
select * from titulos_pedidos;



