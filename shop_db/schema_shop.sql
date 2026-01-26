--------------------------------------------------------
-- SCHEMA FOR SHOP_DB
-- 1. CREATE THE DATABASE
--------------------------------------------------------
-- SHOP_DB: E-COMMERCE CORE SCHEMA
--------------------------------------------------------

CREATE DATABASE IF NOT EXISTS shop_db;
USE shop_db;

-- 1. PRODUCTS
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. CUSTOMERS
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. ORDERS
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- 4. ORDER DETAILS
CREATE TABLE order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

--------------------------------------------------------
-- DATA SEEDING
--------------------------------------------------------

INSERT INTO products (name, description, price, stock) VALUES
('Laptop', 'High-performance laptop.', 999.99, 50),
('Smartphone', 'Latest model smartphone.', 699.99, 100),
('Headphones', 'Noise-cancelling headphones.', 199.99, 200);

INSERT INTO customers (first_name, last_name, email, phone, address, city, state, postal_code, password_hash) 
VALUES 
('Thiago', 'Silva', 't.silva@uol.com.br', '+55 11 91234-5678', 'Av. Paulista 1000', 'Sao Paulo', 'SP', '01310-100', '$2y$10$T1h3Ag0S1lv4Xyz9876543210AbCdEfGhIjKlMnOpQrStUvWxYz1'),
('Hans', 'Müller', 'h.mueller@t-online.de', '+49 171 1234567', 'Alexanderplatz 1', 'Berlin', 'Berlin', '10178', '$2y$10$H4n5M03ll3rQweRtyUiOpAsDfGhJkLzXcVbNm1234567890AbC');