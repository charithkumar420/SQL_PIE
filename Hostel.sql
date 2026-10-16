-- 1. Create Table
CREATE TABLE Hostel (
    Hostel_id INT PRIMARY KEY,
    Hostel_name VARCHAR(100),
    Location VARCHAR(150),
    Total_rooms INT,
    Fees_per_semester DECIMAL(10,2),
    Warden_name VARCHAR(100)
);

-- 2. Insert 10 rows of values
INSERT INTO Hostel (Hostel_id, Hostel_name, Location, Total_rooms, Fees_per_semester, Warden_name) VALUES
(1, 'Vivekananda Bhavan', 'Hitech City, Hyderabad', 120, 45000.00, 'Dr. Ramesh Rao'),
(2, 'Tagore Hostel', 'Gachibowli, Hyderabad', 150, 48000.00, 'Mrs. Sunita Sharma'),
(3, 'Sarojini Hostel', 'Kondapur, Hyderabad', 100, 42000.00, 'Ms. Pooja Reddy'),
(4, 'Bose Bhavan', 'Madhapur, Hyderabad', 130, 46000.00, 'Mr. Arjun Singh'),
(5, 'CV Raman Hostel', 'LB Nagar, Hyderabad', 110, 40000.00, 'Dr. Kavita Iyer'),
(6, 'Patel Hostel', 'Secunderabad', 140, 44000.00, 'Mr. Suresh Patel'),
(7, 'Nehru Bhavan', 'Ameerpet, Hyderabad', 125, 47000.00, 'Mrs. Lakshmi Devi'),
(8, 'Gandhi Hostel', 'Kukatpally, Hyderabad', 160, 43000.00, 'Dr. Mohan Kumar'),
(9, 'Indira Bhavan', 'Begumpet, Hyderabad', 90, 49000.00, 'Ms. Anjali Mehta'),
(10, 'Subhash Hostel', 'Uppal, Hyderabad', 105, 41000.00, 'Mr. Vijay Kumar');

-- 3. Check data
SELECT * FROM Hostel;