CREATE DEFINER=`root`@`%` PROCEDURE `classicmodels`.`AjustarPrecioProducto`(in codigo varchar(15) , inout factorMSRP decimal(10,2))
BEGIN
	update classicmodels.products 
	set msrp = msrp * factorMSRP
	where productCode = codigo;
	select msrp into factorMSRP from products where productCode = codigo; 

END