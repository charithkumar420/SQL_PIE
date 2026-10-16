-- 1. Create Table
CREATE TABLE Accounts (
    Accounts_id INT PRIMARY KEY,
    Customer_id INT,
    Account_type VARCHAR(50),
    Balance DECIMAL(12,2),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

-- 2. Insert 5 rows of values
-- Assuming Customer_id 1 to 5 already exist in Customer table
INSERT INTO Accounts (Accounts_id, Customer_id, Account_type, Balance) VALUES
(101, 1, 'Savings', 45000.50),
(102, 2, 'Current', 125000.00),
(103, 3, 'Savings', 23000.75),
(104, 4, 'Fixed Deposit', 500000.00),
(105, 5, 'Savings', 18500.25);

-- 3. Check data with Customer names
SELECT a.Accounts_id, c.Customer_name, a.Account_type, a.Balance
FROM Accounts a
JOIN Customer c ON a.Customer_id = c.Customer_id;