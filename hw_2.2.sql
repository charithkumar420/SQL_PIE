create database HANDLE;

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