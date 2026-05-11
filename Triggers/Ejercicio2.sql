create table if not exists BuyPriceLogs (
	productCode varchar(15),
	updateDate datetime,
	userName varchar(128),
	previousPrice decimal(10, 2),
	newPrice decimal(10, 2),
	primary key(productCode, updateDate)
);

delimiter //
create trigger logbuyprice after update on classicmodels.products for each row
begin
	insert into classicmodels.BuyPriceLogs
	values (
		old.productCode,
		current_date(),
		current_user(),
		old.MSRP,
		new.MSRP);
end//
delimiter ;
