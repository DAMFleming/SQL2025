describe classicmodels.orderdetails;
describe classicmodels.orders;
describe classicmodels.products;
select * from customers;
select * from products where productCode = 'S10_1678';
-- 7930 -> 7927
-- priceEach -> 95.70
select * from classicmodels.orderdetails where orderNumber = 1234;
select * from orders where orderNumber = 1234;
select * from orderdetails where orderNumber = 1234;
delete from orderdetails where orderNumber = 1234;

insert into orders values (1234, current_date(), date_add(current_date(), interval 1 month), null, '*****', null, 103);
insert into orderdetails values (1234, 'S10_1678', 3, 0, 1);  