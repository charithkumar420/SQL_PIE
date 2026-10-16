use PPFT;

select * from Cust;
select * from Account;
select * from TRANSACTIONS;

-- FULL OUTER JOIN

select 
c.Cust_id,
c.Cust_Name,
c.City,
a.Acc_id,
a.Acc_type,
a.bal
from Cust as c
full outer join Account as a
on c.Cust_id=a.Cust_id;

select 
c.Cust_id,
c.Cust_Name,
c.City,
a.Acc_id,
a.Acc_type,
a.bal
from Cust as c
inner join Account as a
on c.Cust_id=a.Cust_id;

select 
c.Cust_id,
c.Cust_Name,
c.City,
a.Acc_id,
a.Acc_type,
a.bal
from Cust as c
left join Account as a
on c.Cust_id=a.Cust_id;

select
a.Acc_id,
a.Acc_type,
a.bal,
c.Cust_id,
c.Cust_Name,
c.City
from Account as a
right join Cust as c
on a.Cust_id=c.Cust_id;

-- SELF JOIN

select
c1.Cust_Name as Customer1,
c2.Cust_Name as Customer2,
c1.City 
from Cust as c1
inner join Cust as c2
on c1.City = c2.City
and c1.Cust_id < c2.Cust_id;

select * from Cust;

update Cust
set City = case Cust_id
	when 100 then 'warangal'
	when 200 then 'Hyderabad'
	when 300 then 'warangal'
	when 400 then 'Delhi'
	when 500 then 'Shimla'
end;

select * from Cust;

select
c1.Cust_Name as Customer1,
c2.Cust_Name as Customer2,
c1.City 
from Cust as c1
left join Cust as c2
on c1.City = c2.City
and c1.Cust_id < c2.Cust_id;

select
c1.Cust_Name as Customer1,
c2.Cust_Name as Customer2,
c1.City 
from Cust as c1
right join Cust as c2
on c1.City = c2.City
and c1.Cust_id < c2.Cust_id;

select
c1.Cust_Name as Customer1,
c2.Cust_Name as Customer2,
c1.City 
from Cust as c1
inner join Cust as c2
on c1.City = c2.City
and c1.Cust_id < c2.Cust_id;

select 
a.Acc_type,
t.Trans_type,
t.Amount
from Account as a
full outer join TRANSACTIONS as t
on a.Acc_id = t.Acc_id;

select 
c.Cust_id,
c.Cust_Name,
t.Acc_type
from Cust as c
cross join 
(
values
('Savings'),('Current'),('Wallet')
) as t(Acc_type);
