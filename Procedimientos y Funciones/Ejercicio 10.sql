CREATE PROCEDURE ContarFilas(bd varchar(200))
BEGIN
	
    declare tabla varchar(100);
    
	declare c cursor for
		select table_name
		from information_schema.tables
		where table_schema = bd;
	
	declare exit handler for not found close c;
	
	open c;
	loop
		fetch c into tabla;
		set @consulta = concat('select count(*) ', tabla, ' from ', bd, '.', tabla);
		prepare stm from @consulta;
        execute stm;
		deallocate prepare stm;
	end loop;
END