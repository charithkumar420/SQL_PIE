create database HANDLE;

use HANDLE;

-- 1. CUSTOMERS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name        VARCHAR(50),
    city        VARCHAR(50),
    signup_date DATE
);

-- 2. PRODUCTS
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    category     VARCHAR(30),
    price        DECIMAL(8,2)
);

-- 3. ORDERS (links the other two)
CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    product_id  INT,
    quantity    INT,
    order_date  DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Asha',   'Hyderabad', '2025-01-15'),
(2, 'Ravi',   'Mumbai',    '2025-03-02'),
(3, 'Meera',  'Delhi',     '2025-06-20'),
(4, 'Karan',  'Hyderabad', '2025-09-11'),
(5, 'Sneha',  'Bengaluru', '2026-01-05'),
(6, 'Imran',  'Chennai',   '2026-02-18');   

INSERT INTO products VALUES
(101, 'Laptop',     'Electronics', 55000.00),
(102, 'Headphones', 'Electronics',  2500.00),
(103, 'Desk Chair', 'Furniture',    7500.00),
(104, 'Notebook',   'Stationery',     120.00),
(105, 'Pen Pack',   'Stationery',      80.00),
(106, 'Monitor',    'Electronics', 14000.00);

INSERT INTO orders VALUES
(1001, 1, 101, 1, '2026-01-10'),
(1002, 1, 102, 2, '2026-02-14'),
(1003, 2, 103, 1, '2026-02-20'),
(1004, 3, 104, 10, '2026-03-05'),
(1005, 3, 105, 20, '2026-03-05'),
(1006, 4, 101, 1, '2026-04-18'),
(1007, 2, 102, 1, '2026-05-22'),
(1008, 5, 106, 2, '2026-06-30'),
(1009, 1, 104, 5, '2026-07-12'),
(1010, 4, 103, 2, '2026-08-01');

use HANDLE;

select * from customers;
select * from products;
select * from orders;

select * from customers where city='Hyderabad';

select * from customers where city='Delhi';

select * from customers where signup_date between '2025-03-02' and '2026-01-05';

select * from products where category = 'Furniture';

select * from products where category = 'Electronics';

select * from products where price between 10000 and 50000 ;

select * from orders where quantity >= 10;

select * from orders where quantity < 10;

-- LIKE OPERATOR 

select * from customers;
select * from products;
select * from orders;

select * from customers where name like 'r%';

select * from customers where name like '_a%';

select * from customers where city like '%%';

select * from products where category like '%%';

-- SORTING AND AGGREGATION FUNCTIONS

select * from orders order by quantity;

select * from orders order by quantity desc;

select * from orders order by order_date desc;

select * from products where price between 100 and 10000 order by price;

select count(category) as AllCategory,
sum(price) as TotalPrice,
avg(price) as AveragePrice,
min(price) as MinPrice,
max(Price) as MaxPrice from products;

-- GROUPING DATA

select category,count(*) as AllCategories from products group by category;

select category,sum(price) as TotalSum from products group by category;

select category,avg(price) as AveragePrices from products group by category;

select category,min(price) as MinimumPrice from products group by category;

select category,max(price) as MaximumPrice from products group by category;

select category,count(*) as AllCategories from products group by category having count(*) >2;

select category,sum(price) as TotalSum from products group by category having sum(price) >=100;

select category,avg(price) as AveragePrices from products group by category having avg(price) <=100;

select category,min(price) as MinimumPrice from products group by category having min(price) >1000;

select category,max(price) as MaximumPrice from products group by category having max(price) <1000;

select category,sum(price) as TotalCount from products where category='Electronics' Group by category having max(price) >= 1000;

-- SINGLE TABLE ANALYSIS

use HANDLE;

select * from customers;
select * from products;
select * from orders;

select order_id,product_id,quantity,                -- Case When
case
    when quantity>=5 then 'Good Selling Product'
    when quantity<=5 then 'Okay Selling Product'
    else 'Bruh!!!'
end as ProductWise
from orders;

-- DERIVED COLUMNS

use HANDLE;

select * from customers;
select * from products;
select * from orders;

-- A derived column is a calculated value produced from one or more existing columns. 
-- It is normally created in the SELECT list and does not automatically add a permanent column to the table

-- Assume a 2% processing fee on every transaction. 

select product_id,product_name,price,
price * 0.02 as ProcessingFees
from products;

-- Assume a 2% processing fee on every transaction and additional fees

select product_id,product_name,price,
price * 0.02 as ProcessingFees,
price + (price * 0.02) as TotalFees
from products;

select product_id,product_name,price,           -- DERIVATIVE COLUMN WITH CASE WHEN
price * 0.02 as ProcessingFees,
price + (price*0.02) as TotalFees,
case
    when price>= 50000 then 'expensive'
    when price>=10000 then 'Affordable'
    else 'CHEEEAAAPP'
end as PriceRating
from products;

-- NULL HANDLING

insert into products(product_id,product_name,category,price)             -- Inserting Null Values
values
(107,'Foldable Iron Chair','Furniture',NULL);

select * from products;

select * from products where price is null;                              -- Finding Null Values

select product_name,price,ISNULL(price,0) as KnownPrice
from products;

select product_name,price,ISNULL(price,'Price not Available') as KnownPrice
from products;                                                              -- Returns error for converting data type varchar to numeric.

select product_name,price,coalesce(price,0) as KnownPrice
from products;

select * from products where price is not null;select product_id,product_name,price,           -- DERIVATIVE COLUMN WITH CASE WHEN AND NULL HANDLING
price * 0.02 as ProcessingFees,
price + (price*0.02) as TotalFees,
case
    when price is null then 'Unavailable Balance'
    when price>= 50000 then 'expensive'
    when price>=10000 then 'Affordable'
    else 'CHEEEAAAPP'
end as PriceRating
from products;

-- STRING AND DATE FUNCTIONS

use HANDLE;

select * from customers;
select * from products;
select * from orders;

select product_id,product_name,
CONCAT(category,' -- ',Price) as ItePrice
from products;

select customer_id,name,
CONCAT(city,' -- ',signup_date) as ItePrice
from customers;

select product_id,product_name,
CONCAT(category,' of Rs. ',Price) as ItePrice
from products;

select order_date, len(order_date) as DateLength
from orders;

select product_name,UPPER(product_name) as UpperCaseName from products;

select product_name,LOWER(product_name) as LowerCaseName from products;

select product_name,TRIM(product_name) as CleanName from products;

select product_name,substring(product_name,1,4) as SubsstringOfName from products;

select * from orders;

select order_id,order_date, DAY(order_date) as DayDate from orders;

select order_id,order_date, month(order_date) as MonthDate from orders;

select order_id,order_date, Year(order_date) as YearDate from orders;

select datediff(day,'2026-01-10','2026-04-18') as DayDate;

select order_id,order_date, datediff(day,order_date,cast('2026-04-18' as date)) as DayDate from orders;

select order_id,order_date, datediff(MONTH,order_date,cast('2026-04-18' as date)) as MOnthDate from orders;

select order_id,order_date, datediff(day,order_date,cast('2026-04-18' as date)) as YearDate from orders;

select order_id,order_date, DAY(order_date) as DayDate from orders;

-- JOINS P-1
-- INNER JOIN, LEFT JOIN, RIGHT JOIN

use HANDLE;

select * from customers;
select * from products;
select * from orders;

select c.customer_id,c.name,c.city,                      -- Inner Join returns only rows that have matching values in both tables.
o.order_id,o.customer_id,o.quantity from customers as c
inner join orders as o
on c.customer_id=o.customer_id;

select c.customer_id,c.name,c.city,                      -- LEFT JOIN returns all rows from the left table and matching rows from the right table. If there is no match,
o.order_id,o.customer_id,o.quantity 
from customers as c                                      -- right-table columns contain NULL.
left join orders as o
on c.customer_id=o.customer_id;

select c.customer_id,c.name,c.city,                      -- RIGHT JOIN returns all rows from the right table and matching rows from the left table.
o.order_id,o.customer_id,o.quantity 
from customers as c                                      --  If there is no match, left-table columns contain NULL.
right join orders as o
on c.customer_id=o.customer_id;

-- JOINS P-2
-- FULL OUTER JOIN, SELF JOIN, CROSS JOIN

select c.customer_id,c.name,c.city,                  -- FULL OUTER JOIN returns matching rows and also keeps unmatched rows from both tables. When a row has 
o.order_id,o.customer_id,o.quantity                  -- no match, columns from the missing side show NULL
from customers as c
full outer join orders as o
on c.customer_id=o.customer_id;

select * from customers;
select * from orders;

select c.customer_id,c.name,c.city,
o.order_id,o.quantity,o.order_date
from customers as c
full outer join orders as o
on c.customer_id = o.customer_id;

select c1.name as cu1, c2.name as cu2, c1.city     -- SELF JOIN joins one table to itself. SQL uses aliases so we can refer to the two appearances of the same table separately
from customers as c1
inner join customers as c2
on c1.city=c2.city
and c1.customer_id < c2.customer_id;

select c1.name as cu1, c2.name as cu2, c1.city
from customers as c1
inner join customers as c2
on c1.city=c2.city
and c1.customer_id > c2.customer_id;

select c1.name as cu1, c2.name as cu2, c1.city
from customers as c1
left join customers as c2
on c1.city=c2.city
and c1.customer_id < c2.customer_id;

select c1.name as cu1, c2.name as cu2, c1.city
from customers as c1
right join customers as c2
on c1.city=c2.city
and c1.customer_id < c2.customer_id;

-- CROSS JOIN

-- CROSS JOIN creates every possible combination of rows from two tables or row sets. 
-- It does not require an ON condition.
-- The row-count formula:-
-- Result rows = number of rows in Table A × number of rows in Table B

select c.customer_id, c.name, t.category
from customers as c
cross join
(
values
('Electronics'),('Furniture'),('Stationary')
)as t(category)
order by c.customer_id,t.category;

-- SUBQUERIES AND CTE's(Common Table Expressions)

use HANDLE;

select * from customers;
select * from products;
select * from orders;

-- products with above average price

select AVG(price) from products;     -- A subquery is a SELECT statement placed inside another SQL statement.

select product_id,product_name,price  --  It is also called an inner query or nested query.
from products where price > (
    select AVG(price)
    from products
);

-- products with more than minimum price

select MIN(price) from products;

select product_id,product_name,price
from products where price > (
    select MIN(price) from products
);

-- products with less than maximum price

select MAX(price) from products;

select product_id,product_name,price
from products where price < (
    select MAX(price) from products
);

-- category with highest prices

select product_id,category,price
from products where price = (
    select MAX(price) from products
);

select category,sum(price) as TotalPrice
from products group by category
having sum(price) = (
    select MAX(TotalPrice) from (
        select SUM(price) as Totalprice from products
        group by category
    )as t
);

-- category with Lowest prices

select category,sum(price) as TotalPrice
from products group by category
having sum(price) = (
    select MIN(TotalPrice) from (
        select SUM(price) as Totalprice from products
        group by category
    )as t
);

-- COMMON TABLE EXPRESSION
-- A Common Table Expression (CTE) is a named query result defined with WITH 
-- It lets you label an intermediate step and then reference it in the single SQL statement that follows. 
-- A CTE does not create a permanent table. 

use HANDLE;

select * from customers;
select * from products;
select * from orders;

-- Above Average accounts using cte

select AVG(price) as AveragePrice
from products;

with AverageAccount as
(
    select AVG(price) as AveragePrice
    from products
)
select p.product_id,p.product_name,p.price 
from products as p
cross join AverageAccount as AA
where p.price > AA.AveragePrice;

-- Below Average accounts using cte

select AVG(price) as AveragePrice
from products;

with AverageAccount as
(
    select AVG(price) as AveragePrice
    from products
)
select p.product_id,p.product_name,p.price 
from products as p
cross join AverageAccount as AA
where p.price < AA.AveragePrice;

-----------------------------------------------------------------------------------------------------------------------------------------

alter table products add customer_id int;

update products
set customer_id = case product_id
    when 101 then 1
    when 102 then 2
    when 103 then 3
    when 104 then 4
    when 105 then 1
    when 106 then 5
    when 107 then 6
end;

-- Customer Account details

with CustomerAccounts as
(
    select 
    c.customer_id,
    c.name,
    c.city,
    p.product_id,
    p.product_name,
    p.price
    from customers as c
    inner join products as p
    on c.customer_id = p.customer_id
)
select * from CustomerAccounts
order by price desc;