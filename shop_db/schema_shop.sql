--------------------------------------------------------
-- SCHEMA FOR SHOP_DB
-- 1. CREATE THE DATABASE
CREATE DATABASE shop_db;
USE shop_db;

-- 2. CREATE THE PRODUCTS TABLE
CREATE TABLE products  (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    description TEXT,
    price DECIMAL (10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 3. CREATE THE CUSTOMERS TABLE
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    email VARCHAR (100) NOT NULL UNIQUE,
    phone VARCHAR (20),
    password_hash VARCHAR (255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);


-- 4. CREATE THE ORDERS TABLE
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL (10,2) NOT NULL CHECK (total >= 0),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);



-- 5. CREATE THE ORDER DETAILS TABLE 

CREATE TABLE order_details(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL (10,2) NOT NULL CHECK (price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


---------------------------------------------------------- END OF SCHEMA FOR SHOP_DB


--------------------------------------------------------
-- SAMPLE DATA FOR PRODUCTS TABLE
-- 1. INSERT SAMPLE DATA INTO PRODUCTS TABLE
INSERT INTO products (name, description, price, stock) VALUES
('Laptop', 'A high-performance laptop suitable for all your computing needs.', 999.99, 50),
('Smartphone', 'A latest model smartphone with cutting-edge features.', 699.99, 100),
('Headphones', 'Noise-cancelling over-ear headphones for immersive sound experience.', 199.99, 200);

-- 2. INSERT SAMPLE DATA INTO CUSTOMERS TABLE
INSERT INTO customers (first_name, last_name, email, phone, password_hash) VALUES