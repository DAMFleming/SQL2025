CREATE DEFINER=`root`@`%` PROCEDURE `classicmodels`.`ComprobarStock`(in codigo varchar(15), out mensaje varchar(20))
BEGIN
	declare stock int;
	select quantityInStock into stock from classicmodels.products
	where productCode = codigo;
	
	if stock < 100 then
		set mensaje = 'Stock bajo';
	elseif stock > 1000 then
		set mensaje = 'Stock alto';
	else
		set mensaje= 'Stock moderado';
	end if;
END