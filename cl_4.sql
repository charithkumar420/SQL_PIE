-- Single-table analysis means analyzing or transforming data using columns from one table at a time.

use PPFT;
select * from Cust;
select * from Account;
select * from TRANSACTIONS;

-- CASE WHEN is used to implement conditional business logic in SQL.


select Acc_id,Acc_type,Bal,
case 
	when Bal>=200000 then 'Hiigh Balance'
	when Bal>=20000 then 'Medium Balance'
else 'Low Balance'
end as BalanceType from Account;

select Trans_id,Trans_type,Amount,
case 
	when amount>=100000 then 'High Priority'
	when amount>=10000 then 'Second Priority'
else 'Least Priority'
end as AmountPriority from TRANSACTIONS;

select Trans_id,Amount,
Amount * 0.02 as Trans_Fee from TRANSACTIONS;

-- A derived column is a calculated value produced from one or more existing columns. It is normally created in the 
-- SELECT list and does not automatically add a permanent column to the table. 

-- Derived coloums explains about generating new columns from existing columns

-- Derived columns + case when = h/w

-----------------------------------------------------------------------------------------------------------------------

-- NULL represents a missing, unknown or unavailable value. NULL is not the same as zero and is not the same as an empty string.

insert into Account
(Acc_id,Cust_id,Acc_type,Bal)
Values
(1006,400,'Current',NULL);

select * from Account;

select * from Account where Bal is null;

select * from Account where Bal is not null;

select Acc_id,Bal,isnull(Bal,0) as AvailableBal from Account;

-- H/W

select * from TRANSACTIONS;

select Trans_id,Trans_type,Amount,
Amount * 0.02 as Processingfee,
Amount + (Amount * 0.02) as TotalFee,
case 
	when Amount >= 10000 then 'High Amount'
	when Amount >= 1000 then 'Medium Amount'
	else 'Low Amount'
end as TransactionCategory
from TRANSACTIONS;