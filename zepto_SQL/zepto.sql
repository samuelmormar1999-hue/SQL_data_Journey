DROP DATABASE IF EXISTS zepto; 
CREATE DATABASE zepto
    DEFAULT CHARACTER SET = 'utf8mb4';
USE zepto;

CREATE TABLE zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC (8,2),
discountPercent NUMERIC (5,2),
availableQty INTEGER,
discountSellingPrice NUMERIC (8,2),
weightInGms INTEGER,
outOfStock BOOLEAN, 
quantity INTEGER
);