-- 1. Create Table
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Phno VARCHAR(15),
    Address VARCHAR(200)
);

-- 2. Insert 5 rows of values
INSERT INTO Customer (Customer_id, Customer_name, Phno, Address) VALUES
(1, 'Amit Verma', '9876543210', 'Hitech City, Hyderabad'),
(2, 'Neha Singh', '9123456789', 'Andheri West, Mumbai'),
(3, 'Ravi Kumar', '9988776655', 'Koramangala, Bangalore'),
(4, 'Pooja Reddy', '9012345678', 'Gachibowli, Hyderabad'),
(5, 'Suresh Patel', '8765432109', 'Satellite, Ahmedabad');

-- 3. Check data
SELECT * FROM Customer;