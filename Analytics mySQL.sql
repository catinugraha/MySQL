use retrowheels;

-- ANSWER Question 1
select count(distinct customerName) as Costumers, 
count(distinct city) as Cities, count(distinct country) as Countries from customers;

-- ANSWER Question 2
select 
count(distinct e.employeeNumber) as Employees,
count(distinct e.officeCode) as Office ,
count(distinct o.country) as Country,
count(distinct productCode) as Products,
(select sum(quantityInStock) from products) as StockProducts,
count(distinct productVendor) as Vendors
from products, employees e
join offices o on e.officeCode = o.officeCode;

-- ANSWER Question 3
select productLine, min(buyPrice) as minPrice, max(buyPrice) as maxPrice
from products
group by productLine;

-- ANSWER Question 4
select 
c.customerName as customerName, 
c.city as city, 
c.country as country, 
sum(p.amount) as Total
from customers c
join payments p on c.customerNumber = p.customerNumber
group by customerName
order by Total DESC
limit 10;

-- ANSWER Question 5
select 
c.customerName as customername,
pr.productName as productname,
s.quantityOrdered as quantityordered,
s.priceEach as priceEach
from payments p
join customers c on c.customerNumber = p.customerNumber
join orders o on o.customerNumber = c.customerNumber
join orderdetails s on s.orderNumber = o.orderNumber
join products pr on pr.productCode = s.productCode
where paymentDate = '2003-06-05'
and s.ordernumber = 10123;