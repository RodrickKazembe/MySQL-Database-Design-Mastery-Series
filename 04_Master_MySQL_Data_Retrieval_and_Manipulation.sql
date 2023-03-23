-- Fetching all data from the 'Customers' table
SELECT * FROM Customers;

-- Fetching a list of customers who live in 'New York'
SELECT * FROM Customers WHERE city = 'New York';

-- Sorting the list of New York customers by their last name in alphabetical order
SELECT * FROM Customers WHERE city = 'New York' ORDER BY last_name ASC;
Assuming you have an 'Orders' table with 'order_id', 'customer_id', 'order_date', and 'order_value' columns:

-- Calculating the total revenue, average order value, and the highest and lowest order values
SELECT
  SUM(order_value) AS total_revenue,
  AVG(order_value) AS average_order_value,
  MAX(order_value) AS highest_order_value,
  MIN(order_value) AS lowest_order_value
FROM Orders;

-- These queries demonstrate the basic principles of data retrieval and manipulation in MySQL, as outlined in the video script. They show how to fetch data, filter results, sort data, and use aggregate functions to perform calculations on a group of rows.