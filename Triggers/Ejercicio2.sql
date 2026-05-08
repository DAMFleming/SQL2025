create table BuyPriceLogs (
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
	
end//
delimiter ;
