CREATE DATABASE IF NOT EXISTS OnlineBookstore;

USE OnlineBookstore;

-- Adjusted Authors table
CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  birthdate DATE,
  email VARCHAR(255) UNIQUE NOT NULL,
  INDEX (last_name)
);

-- New Customers table
CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  birthdate DATE,
  email VARCHAR(255) UNIQUE NOT NULL,
  INDEX (last_name)
);

-- Existing Publishers and Books tables
CREATE TABLE Publishers (
  publisher_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255)
);

CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  publication_date DATE,
  price DECIMAL(6, 2),
  author_id INT,
  publisher_id INT,
  FOREIGN KEY (author_id) REFERENCES Authors(author_id),
  FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

-- Comments

-- Changes made to the Authors table:
---- Split the 'name' column into 'first_name' and 'last_name' columns with data type VARCHAR(255) and NOT NULL constraint.
---- Added a new 'email' column with data type VARCHAR(255), UNIQUE and NOT NULL constraints.
---- Created an index on the 'last_name' column to improve search performance based on the authors' last names.

-- New Customers table:
---- Created a new 'Customers' table with columns 'customer_id', 'first_name', 'last_name', 'birthdate', and 'email'.
---- Added appropriate data types and constraints (e.g., PRIMARY KEY, NOT NULL, UNIQUE) to the columns.
---- Created an index on the 'last_name' column to improve search performance based on the customers' last names.

--The existing Publishers and Books tables remain unchanged.
