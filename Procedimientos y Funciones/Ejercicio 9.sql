CREATE PROCEDURE classicmodels.ProductosStockBajo(
	out totalProductos int
)
BEGIN
	declare codigo varchar(15);
	declare stock smallint;
	declare c cursor for
		select productCode, quantityInStock
		from products
		where quantityInStock < 500;
	declare exit handler for not found close c;
	set totalProductos := 0;
	open c;
	loop
		fetch c into codigo, stock;
		select codigo, stock;
		set totalProductos := totalProductos + 1;
	end loop;
END