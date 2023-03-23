CREATE DATABASE IF NOT EXISTS OnlineBookstore;

USE OnlineBookstore;

CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birthdate DATE
);

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
