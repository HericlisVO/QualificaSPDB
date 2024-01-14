use relacionamentos;


create table recursiva (
			rec_id int primary key auto_increment,
            rec_nome varchar(100) not null,
            rec_desc varchar(6000) not null,
            rec_date timestamp not null default current_timestamp ON UPDATE current_timestamp,
            rec_sementes int,
            rec_anterior int,
            
            foreign key(rec_anterior)references recursiva(rec_id)

);

desc recursiva;



insert into recursiva (rec_nome, rec_desc, rec_sementes )
						values
                        
                        
                        ('Perobas7','no no nono no',2 ),
                        ('Perobas8','no no nono no', 25),
                       ('Perobas9','no no nono no', 25)
                        
                        ;
                        
                        
                        
                        select * from recursiva;
                        
	 -- error ao tentar deletar uma chave com sua chave estrangeira        
		delete from recursiva where red_id =1;
		delete from recursiva where red_id =4;
		delete from recursiva where red_id =5;
		delete from recursiva where red_id =6;
        
	-- sucesso ao tentar deletar tabelas sem uma chaves estrangeira;
    
		delete from recursiva where red_id =19;
                        
