CREATE DEFINER=`root`@`%` PROCEDURE `classicmodels`.`PedidosPorProovedor`(in customer int)
BEGIN
	select * from customers where customerNumber = customer;
END