CREATE DEFINER=`root`@`%` PROCEDURE `classicmodels`.`CrearPedido`(
	IN numeroPedido int,
	IN numeroCliente int,
	OUT mensaje varchar(50)
)
BEGIN
	DECLARE fechaActual date default CURDATE();
	DECLARE semanaDespues date default ADDDATE(fechaActual, INTERVAL 1 WEEK);
	DECLARE exit handler for 1062
	SET mensaje = "Error: Número de pedido no válido";
	DECLARE exit handler for 1452
	SET mensaje = "Error: Número de cliente no válido";

	INSERT INTO orders VALUES (numeroPedido, fechaActual, semanaDespues, 
								null, 'In Process','', numeroCliente);
	
	SET mensaje = "Pedido realizado correctamente";
	
END