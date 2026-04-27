CREATE DEFINER=`root`@`%` PROCEDURE `classicmodels`.`TotalPagosClientes`(in customer int , out pagos decimal)
BEGIN
	select sum(amount) into pagos from payments where customerNumber = customer;
END