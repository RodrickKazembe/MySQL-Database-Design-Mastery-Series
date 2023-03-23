CREATE DATABASE IF NOT EXISTS OnlineBookstore;

USE OnlineBookstore;

-- Existing Authors, Customers, Publishers, and Books tables
-- ...

-- New Customer_Addresses table (One-to-One relationship)
CREATE TABLE Customer_Addresses (
  customer_id INT PRIMARY KEY,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(255),
  postal_code VARCHAR(50),
  country VARCHAR(255) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- New Products table
CREATE TABLE Products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(6, 2) NOT NULL
);

CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_value DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Books(book_id)
);



-- New Customer_Addresses table:
--- Demonstrates a one-to-one relationship between Customers and Customer_Addresses.
--- Each customer has a unique address, and each address is linked to a single customer.
--- Uses the 'customer_id' as the primary key in the 'Customers' table and as a foreign key in the 'Customer_Addresses' table.

-- New Products table:
--- Stores information about products in the online bookstore, such as name, description, and price.

-- New Purchases table:

-- Demonstrates a many-to-many relationship between Customers and Products.
-- An intermediary table called a junction table, which links 'Customers' and 'Products' using foreign keys.
-- Stores information about purchases made by customers, including purchase_date and quantity.
-- The existing Authors, Customers, Publishers, and Books tables remain unchanged.