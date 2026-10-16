use PPFT;
select * from Cust ;
select * from Account ;
select * from TRANSACTIONS ;

select Acc_id,Bal from Account order by Bal asc;

select Acc_id,Bal from Account order by Bal desc;

select Acc_id,Bal from Account order by Bal,Acc_id desc;

select * from Cust order by Cust_Name; -- ascending order by default

select * from Cust order by Cust_Name desc;

select * from Account where Acc_id >=1003 order by Bal desc;

select count(*) as TotalBalance from Account;

select count(Trans_type) as TotalBalance from TRANSACTIONS;

select sum(Bal) as TotalBalance from Account;

select min(bal) as MinBal from Account;

select max(bal) as MaxBal from Account;

select avg(bal) as AvgBal from Account;

select count(*) as TotalBal, 
sum(bal) as FullBal, 
min(bal) as MinBal, 
max(bal) as MaxBal, 
avg(bal) as AvgBal from Account;