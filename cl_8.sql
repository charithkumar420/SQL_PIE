use PPFT;

select * from Cust;
select * from Account;
select * from TRANSACTIONS;

select Acc_id,Acc_type,Bal                    -- SQL SUBQUERY
from Account where Bal= (                     -- A subquery is a SELECT statement placed inside another SQL statement. 
	select max(Bal) from Account              -- It is also called an inner query or nested query.
);

select Acc_id,Acc_type,Bal                    
from Account where Bal= (                     
	select min(Bal) from Account
);

select Cust_Name from Cust          -- customers with balance above 20,000
where Cust_id in(
	select Cust_id from Account 
	where Bal > 20000
);

select c.Cust_name,c.Cust_id
from Cust as c
where exists (
	select 3
	from Account as a
	where a.Cust_id=c.Cust_id
);


select c.Cust_name,c.Cust_id
from Cust as c
where not exists (
	select 3
	from Account as a
	where a.Cust_id=c.Cust_id
);

