use ppft;
select * from Cust ;
select * from Account;
select * from TRANSACTIONS ;
-- 1. Find all customers from Hyderabad. 
select Cust_Name from Cust;
-- 2. Find all Savings accounts. 
select * from Account where Acc_type = 'Saving';
-- 3. Find accounts with balance greater than ₹40,000. 
select * from Account where Bal > 40000;
-- 4. Find customers from Hyderabad or Chennai using IN. 
select * from Cust where City in ('Hyderabad','Chennai');
-- 5. Find accounts with balance between ₹35,000(₹2000) and ₹50,000.
select * from Account where Bal between 20000 and 50000;
-- 6. Find customers whose name starts with S(n).
select * from Cust where Cust_Name like 'n%';
-- 7. Find customers whose name contains Kumar. 
select * from Cust where Cust_Name like 'k%';
-- 8. Find transactions with amount greater than ₹10,000. 
select * from TRANSACTIONS where Amount > 10000;
-- 9. Find Deposit transactions.
select Trans_Type from TRANSACTIONS;
-- 10. Find Deposit transactions with amount between ₹10,000 and ₹25,000.
select * from TRANSACTIONS where Amount between 10000 and 25000;
