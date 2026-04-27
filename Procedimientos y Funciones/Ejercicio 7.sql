CREATE DEFINER=`root`@`%` PROCEDURE `classicmodels`.`crearPedido2`(
	IN numeroCliente int,
	out mensaje varchar(50))
BEGIN
	declare numeroPedido int;
	declare fechaActual date default curdate();
	declare semanaDespues date default adddate(fechaActual, interval 1 week);
	select MAX(orderNumber) into numeroPedido from orders;
	set numeroPedido := numeroPedido + 1;
	INSERT into orders values (numeroPedido, fechaActual, SemanaDespues, null, 'in process', '', numeroCliente);
	set mensaje = "pedido creado correctamente";
END