drop trigger if exists nombreProducto;
delimiter //
create trigger nombreProducto before insert on classicmodels.products for each row 
begin
	if exists(select count(productName) from classicmodels.products where productName = new.productName) then
		signal sqlstate '15000';
	end if;
end//
delimiter ;

