drop trigger if exists altaDetalle;
delimiter //
create trigger altaDetalle before insert on classicmodels.orderdetails for each row 
begin
	declare stock smallint;
    declare vmsrp decimal(10, 2);
    select quantityInStock, MSRP into stock, vmsrp from classicmodels.products where productCode = new.productCode;
    if (stock < new.quantityOrdered) then
		signal sqlstate '15000';
    else
		if (new.priceEach is null) then
			set new.priceEach = vmsrp;
		end if;
		update classicmodels.products set quantityInStock = quantityInStock - new.quantityOrdered where productCode = new.productCode ;
    end if;
end//
delimiter ;