CREATE DEFINER=`root`@`%` FUNCTION `classicmodels`.`AjustarPrecioProductoFuncion`(cod varchar(15), factor decimal(10,2)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
	declare nuevomrsp decimal(10,2);
	
	update classicmodels.products 
	set msrp = msrp * factor
	where productCode = cod;

	select msrp into nuevomrsp from products where productCode = cod; 
	return nuevomrsp;
END