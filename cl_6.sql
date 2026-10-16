use PPFT;

select * from Cust;
select * from Account;
select * from TRANSACTIONS;

-- JOINS p1

select 
Cust.Cust_id,
Cust.Cust_Name,
Cust.City,
Account.Acc_id,
Account.Acc_type,
Account.Bal from Cust
Inner join Account
on Cust.Cust_id=Account.Cust_id;

select 
Cust.Cust_id,
Cust.Cust_Name,
Cust.City,
Account.Acc_id,
Account.Acc_type,
Account.Bal from Cust
left join Account
on Cust.Cust_id=Account.Cust_id;

select 
Account.Acc_id,
Account.Acc_type,
Account.Bal,
TRANSACTIONS.Trans_id,
TRANSACTIONS.Trans_type,
TRANSACTIONS.Amount
from Account
inner join TRANSACTIONS
on Account.Acc_id=TRANSACTIONS.Acc_id;

select 
Account.Acc_id,
Account.Acc_type,
Account.Bal,
TRANSACTIONS.Trans_id,
TRANSACTIONS.Trans_type,
TRANSACTIONS.Amount
from Account
left join TRANSACTIONS
on Account.Acc_id=TRANSACTIONS.Acc_id;

select 
Account.Acc_id,
Account.Acc_type,
Account.Bal,
Cust.Cust_id,
Cust.Cust_Name,
Cust.City
from Account
right join Cust
on Account.Cust_id=Cust.Cust_id;

select
c.Cust_Name,
a.Acc_type,
t.Trans_id,
t.Trans_type,
t.Amount
from Cust as c
inner join Account as a
on c.Cust_id=a.Cust_id
inner join TRANSACTIONS as t
on a.Acc_id=t.Acc_id;