Shop_DB: E-Commerce Relational Schema
📝 Description This project consists of a relational database schema designed for a standard online store. It handles core business entities such as customers, products, and orders, ensuring data integrity through the use of InnoDB constraints.

🚀 Key Features * Normalization: Designed following 3rd Normal Form (3NF) principles to reduce data redundancy.

Data Integrity: Implements Foreign Keys, Unique constraints, and CHECK clauses to prevent negative prices or stock levels.

Logistics Ready: Includes customer shipping details (address, city, state, and postal code) and order status tracking.

Security: Prepared for storing hashed passwords for secure user authentication.

🛠️ Database Structure The schema is composed of 4 main tables:

products: Stores inventory items with price and stock management.

customers: Stores user profiles, contact information, and encrypted credentials.

orders: Tracks the "header" of a purchase (customer ID, date, and total amount).

order_details: A junction table that allows multiple products per order, preserving the unit price at the time of purchase.

📈 Scalability & Future Improvements While this schema serves as a robust core for an e-commerce MVP, it is designed to be easily extendable. Future iterations could include:

Product Categories: Implementing a 1:N relationship to organize the catalog.

Payment Tracking: A dedicated table to handle different payment methods (Credit Card, PayPal, etc.).

Review System: Allowing customers to leave ratings and comments on products.