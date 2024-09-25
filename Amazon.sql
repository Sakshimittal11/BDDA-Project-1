-- Create and select database
CREATE DATABASE IF NOT EXISTS amazon_db;
USE amazon_db;


-- Create Customers table 
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    Customer_id CHAR(10) NOT NULL,
    C_contact CHAR(10) NOT NULL,
    PRIMARY KEY (Customer_id),
    UNIQUE KEY (Customer_id),
    UNIQUE KEY (C_contact)
);

-- Insert sample data into Customers
INSERT INTO Customers VALUES 
('C001', '1234567890'),
('C002', '0987654321'),
('C003', '1122334455');

-- Create Vendors table
DROP TABLE IF EXISTS Vendors;
CREATE TABLE Vendors (
    Vendor_id CHAR(10) NOT NULL,
    Vendor_name CHAR(10) NOT NULL,
    Contact_person CHAR(10) NOT NULL,
    V_contact CHAR(10) NOT NULL,
    PRIMARY KEY (Vendor_id),
    UNIQUE KEY (Vendor_id),
    UNIQUE KEY (V_contact)
);

-- Insert sample data into Vendors
INSERT INTO Vendors VALUES 
('V001', 'Amazon Warehouse', 'Alice Johnson', '1111111111'),
('V002', 'Tech Solutions', 'Bob Williams', '2222222222');

-- Create Products table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    Product_id CHAR(10) NOT NULL,
    Product_name VARCHAR(20) NOT NULL,
    Product_category VARCHAR(20) DEFAULT NULL,
    Unit_price DECIMAL(7,2) NOT NULL,
    Stock_quantity INT NOT NULL,
    Vendor_id CHAR(10) NOT NULL,
    PRIMARY KEY (Product_id),
    FOREIGN KEY (Vendor_id) REFERENCES Vendors(Vendor_id)
);

-- Insert sample data into Products
INSERT INTO Products VALUES 
('P001', 'Echo Dot', 'Electronics', 49.99, 100, 'V001'),
('P002', 'Kindle Paperwhite', 'Electronics', 129.99, 50, 'V002'),
('P003', 'Fire TV Stick', 'Electronics', 39.99, 200, 'V001');

-- Create Orders table
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    Order_id CHAR(10) NOT NULL,
    Order_date DATE NOT NULL,
    Product_id CHAR(10) NOT NULL,
    Quantity DECIMAL(7,2) NOT NULL,
    Amount DECIMAL(7,2) NOT NULL,
    Customer_id CHAR(10) DEFAULT NULL,
    PRIMARY KEY (Order_id),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- Insert sample data into Orders
INSERT INTO Orders VALUES 
('O001', '2024-08-20', 'P001', 2.00, 99.98, 'C001'),
('O002', '2024-08-21', 'P002', 1.00, 129.99, 'C002'),
('O003', '2024-08-22', 'P003', 1.00, 39.99, 'C003');

-- Create Payments table
DROP TABLE IF EXISTS Payments;
CREATE TABLE Payments (
    Payment_id CHAR(10) NOT NULL,
    Payment_mode ENUM('Credit Card', 'Debit Card', 'UPI', 'Net Banking', 'Cash') NOT NULL,
    Payment_date DATE NOT NULL,
    Order_id CHAR(10) DEFAULT NULL,
    PRIMARY KEY (Payment_id),
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

-- Insert sample data into Payments
INSERT INTO Payments VALUES 
('PM001', 'Credit Card', '2024-08-20', 'O001'),
('PM002', 'Cash', '2024-08-21', 'O002'),
('PM003', 'Debit Card', '2024-08-22', 'O003');

-- Create Reviews table
DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews (
    Review_id CHAR(10) NOT NULL,
    Product_id CHAR(10) NOT NULL,
    Customer_id CHAR(10) NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review_date DATE NOT NULL,
    Comment TEXT,
    PRIMARY KEY (Review_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

-- Insert sample data into Reviews
INSERT INTO Reviews VALUES 
('R001', 'P001', 'C001', 5, '2024-09-17', 'Great product! Works perfectly with Alexa.'),
('R002', 'P002', 'C002', 4, '2024-09-18', 'Love the Kindle, but battery life could be better.');

-- Create Shelves table
DROP TABLE IF EXISTS Shelves;
CREATE TABLE Shelves (
    Shelf_id CHAR(10) NOT NULL,
    Manager_id CHAR(10) DEFAULT NULL,
    Product_id CHAR(10) NOT NULL,
    PRIMARY KEY (Shelf_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- Insert sample data into Shelves
INSERT INTO Shelves VALUES 
('S001', NULL, 'P001'),
('S002', NULL, 'P002'),
('S003', NULL, 'P003');
