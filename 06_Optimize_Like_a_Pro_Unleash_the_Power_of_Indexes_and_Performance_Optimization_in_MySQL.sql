-- 1. Create an index on the 'email' column in the 'Customers' table:
CREATE INDEX idx_customers_email
ON Customers(email);

-- 2.Drop an existing index (in this case, let's assume there's an index called 'idx_customers_email' to be dropped):
DROP INDEX idx_customers_email
ON Customers;

-- 3. Create a new index on the 'last_name' column in the 'Customers' table:
CREATE INDEX idx_customers_last_name
ON Customers(last_name);

-- Using the EXPLAIN statement to analyze a query (let's assume we want to analyze a query that fetches customers with a specific last name):

EXPLAIN
SELECT * FROM Customers WHERE last_name = 'Doe';

-- These scripts show how to create, manage, and analyze indexes in MySQL. Remember to run these queries after creating the necessary tables in your database. Apply the best practices for optimizing performance as needed to maintain an efficient database.