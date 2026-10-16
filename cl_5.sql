use PPFT;
select * from Cust;
select * from Account;
select * from TRANSACTIONS;

alter table TRANSACTIONS add Trans_Date date;

update TRANSACTIONS 
set Trans_Date = case Trans_id
	when 1 then '2026-08-12'
	when 2 then '2025-08-22'
	when 3 then '2026-09-02'
	when 4 then '2026-09-12'
	when 5 then '2026-09-22'
end;

-- STRING FUNCTIONS

select Cust_id,Phno,
concat(Cust_Name,' -- ',City) as Cust_Details from Cust;

select Cust_Name,City,
concat(Cust_id,' -- ',Phno) as Phone_Details from Cust;

select Trans_id,
concat(Trans_type,' of Rs. ',Amount) as TotalAmount from TRANSACTIONS;

select Cust_name,
len(Cust_name) as NameLength,
Phno,
len(Phno) as PhoneLength
from Cust;

select Cust_id,
len(Cust_id) as IDLength,
City,
len(City) as CityLength
from Cust;

select Cust_id,City,
len(Cust_id) as IDLength,
len(City) as CityLength
from Cust;

select Cust_Name,
UPPER(Cust_Name) as UpperName from Cust;

select Cust_Name,
LOWER(Cust_Name) as UpperName from Cust;

select Cust_Name,
rtrim(Cust_Name) as CleanName,
ltrim(City) as CleanCity
from Cust;

select * from Cust;

select Cust_Name,
SUBSTRING(Cust_Name,1,3) as FirstThreeDigits
from Cust;

-- DATE FUNCTIONS

select * from TRANSACTIONS;

select Trans_type,Trans_Date,
year(Trans_Date) as OnlyYear 
from TRANSACTIONS;

select Trans_type,Trans_Date,
month(Trans_Date) as OnlyMonth 
from TRANSACTIONS;

select Trans_type,Trans_Date,
day(Trans_Date) as OnlyDay 
from TRANSACTIONS;

select Trans_type,Trans_Date,
DATEDIFF(month,Trans_Date,cast('2026-10-9' as date)) as DaYBeforeOCT9
from TRANSACTIONS;

select Trans_type,Trans_Date,
DATEDIFF(day,Trans_Date,cast('2026-10-9' as date)) as DaYBeforeOCT9
from TRANSACTIONS;

select Trans_Date,
format(Trans_Date,'dd_MM_yyyy') as DD_MM_YYYY
from TRANSACTIONS;