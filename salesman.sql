-- 1. Create Table
CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(5,2)
);

-- 2. Insert 5 rows of values
INSERT INTO Salesman (salesman_id, name, city, commission) VALUES
(1, 'Rahul Sharma', 'Hyderabad', 0.12),
(2, 'Priya Mehta', 'Mumbai', 0.15),
(3, 'Arjun Reddy', 'Bangalore', 0.10),
(4, 'Sneha Patel', 'Delhi', 0.13),
(5, 'Vijay Kumar', 'Chennai', 0.11);

-- 3. Check data
SELECT * FROM Salesman;