use PPFT;

select * from Cust;

select * from Account;

select * from TRANSACTIONS;

select city,count(*) as TotalCustomers from Cust group by City;

select Acc_type,sum(Bal) as TotalBalance from Account group by Acc_type;

select Acc_type,max(Bal) as TotalBalance from Account group by Acc_type;

select Acc_type,avg(Bal) as TotalBalance from Account group by Acc_type;

select Acc_type,min(Bal) as TotalBalance from Account group by Acc_type;

select Acc_type,count(*) as Total_Accounts from Account group by Acc_type;

-- A single line comment in sql is commonly done by placing 2 hyphens next to each other

/* A multiline comment
looks like this */

select Trans_type,count(*) as TotalTransType from TRANSACTIONS group by Trans_type;

/* select Trans_type,
count(*) as TotalTransType 
from TRANSACTIONS 
group by Trans_type; */

select City,count(*) as TotalCustomers from Cust group by City having Count(*) > 1;

-- having clause is used to filter the data after grouping with aggregation functions

select Acc_type,sum(Bal) as TotalAmount from Account group by Acc_type having sum(Bal) >= 100000;

select Acc_type,avg(Bal) as TotalAmount from Account group by Acc_type having avg(Bal) >= 50000;

select Acc_type,Max(Bal) as TotalAmount from Account group by Acc_type having max(Bal) >= 20000;

select Acc_type,min(Bal) as TotalAmount from Account group by Acc_type having min(Bal) >= 10000;

-- where, group by and having in a query

select Acc_type,sum(Bal) as TotalAmount from Account where Acc_type = 'Saving' group by Acc_type having sum(Bal) >= 100000;
