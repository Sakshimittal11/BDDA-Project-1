# BDDA-Project-1_SQL_BottomUp- Amazon
# Overview
This project demonstrates the design and implementation of a relational database for an e-commerce system, modeled after a typical online shopping platform like Amazon. The database structure is crafted to efficiently manage various aspects of the system, including customer information, product inventory, orders, reviews, and vendor details. The project involves creating several interconnected tables to store and retrieve data related to the shopping, ordering, and reviewing processes on the platform.

# Approach
This project utilizes a top-down approach to database design. We began by identifying the primary entities essential to an e-commerce platform, such as customers, products, orders, and reviews. Subsequently, we defined the relationships between these entities, ensuring that all data flows logically and efficiently throughout the system. The result is a cohesive and well-structured database that supports various operations related to customer management, order processing, product reviews, and vendor interactions.

# Project Structure
The project is structured around the following main entities:

Customers: Stores customer information, including CustomerID, FirstName, LastName, Email, PhoneNumber, Address, and PaymentMethod.
Products: Contains details about products such as ProductID, ProductName, Category, Brand, Price, StockQuantity, Description, and VendorID.
Orders: Tracks order transactions, including OrderID, CustomerID, OrderDate, ShippingAddress, TotalAmount, and OrderStatus.
OrderItems: Manages individual items within an order with fields like OrderItemID, OrderID, ProductID, Quantity, and Price.
Vendors: Stores information about vendors with fields like VendorID, VendorName, ContactPerson, PhoneNumber, Email, and Address.
Reviews: Keeps track of product reviews, including ReviewID, ProductID, CustomerID, Rating, ReviewDate, and Comment.
# Database Schema
The database schema includes the following tables:

Customers
Products
Orders
OrderItems
Vendors
Reviews
Each table is designed with appropriate fields and data types to ensure efficient data storage and retrieval.

# Relationships
The database schema includes the following key relationships:

Customers to Orders: One-to-Many
Orders to OrderItems: One-to-Many
Products to OrderItems: One-to-Many
Products to Reviews: One-to-Many
Vendors to Products: One-to-Many
# Roles and Permissions
The system can include various user roles with different levels of access:

Administrator: Full access to all tables and data.
Customer: Access to personal information, order history, and ability to leave reviews.
Vendor: Manage product listings and view related order details.
Customer Service Representative: View and manage customer orders and reviews.
Auditor: Read-only access to all tables for audit purposes.
Each role is designed with specific permissions to ensure data security and maintain the principle of least privilege.
