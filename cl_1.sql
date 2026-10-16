CREATE DATABASE PPFT;
USE PPFT;
CREATE TABLE CUST
(
Cust_id INT PRIMARY KEY,
Cust_Name VARCHAR(50),
Phno VARCHAR(50),
City VARCHAR(50)
);
SELECT * FROM Cust;

INSERT INTO Cust (Cust_id,Cust_Name,Phno,City)
VALUES
(100,'Naveen','1234','Wgl'),
(200,'Naeem','1254','Wgl'),
(300,'Nawab','1264','Wgl'),
(400,'Nani','1274','Wgl'),
(500,'Nitesh','1284','Wgl');

SELECT * FROM Cust;

CREATE TABLE Account
(
Acc_id INT PRIMARY KEY,
Cust_id  INT,
Acc_type VARCHAR(30),
Bal DECIMAL (12,2),
FOREIGN KEY (Cust_id)
REFERENCES Cust(Cust_id)
);

SELECT * FROM Account;

INSERT INTO Account
(Acc_id,Cust_id,Acc_type,Bal)
VALUES
(1001,100,'Saving','20000'),
(1002,100,'Saving','20000'),
(1003,101,'Current','200000'),
(1004,103,'Saving','2000000'),
(1005,105,'Current','2000');

SELECT * FROM Account;
-- transaction id, account id, transaction type, amount
-- foreign key= account id
-- references account

CREATE TABLE TRANSACTIONS
(
Trans_id INT PRIMARY KEY,
Acc_id INT,
Trans_type VARCHAR(30),
Amount DECIMAL(8,2),
FOREIGN KEY (Acc_id)
REFERENCES Account(Acc_id)
);

SELECT * FROM TRANSACTIONS;

INSERT INTO TRANSACTIONS
(Trans_id,Acc_id,Trans_type,Amount)
VALUES
(1,1001,'Credit card','10000.00'),
(2,1002,'Cash','100.00'),
(3,1003,'Debit card','100000.00'),
(4,1004,'Online Payment','10000.00'),
(5,1005,'Cash','1000.00');

SELECT *FROM TRANSACTIONS;

use ppft;

select * from Cust;
select * from Account;
select * from TRANSACTIONS;

SELECT * FROM Cust WHERE Cust_Name='Nani';

SELECT Cust_Name,Phno FROM Cust WHERE Cust_Name='Nani';

SELECT Cust_Name,Phno FROM Cust WHERE Cust_Name='ani';

select * from Account

select * from Account where Bal =20000;

select * from Account where Bal >=20000;

select * from Account where Acc_type='Saving';

select * from Account where Acc_type='Current';

select * from Account where Acc_type='Saving' and Bal >=20000;

select * from Account where Acc_type='Saving' or Bal > 20000;

select * from Cust where Cust_Name in ('Naveen','Nani','Nawab');

-- in command is used instead of or command
-- makes it look clean and is efficient

select * from Account where Bal between 20000 and 2000000;
