-- Fetching all data from the 'Customers' table
SELECT * FROM Customers;

-- Fetching a list of customers who live in a city that starts with 'B'
SELECT customers.*,customer_addresses.city
FROM customers 
INNER JOIN customer_addresses ON customers.customer_id = customer_addresses.customer_id
WHERE customer_addresses.city LIKE 'B%';

-- Sorting the list of customers who live in a city that starts with b by their last name in alphabetical order
SELECT customers.*,customer_addresses.city
FROM customers 
INNER JOIN customer_addresses ON customers.customer_id = customer_addresses.customer_id
WHERE customer_addresses.city LIKE 'B%'
ORDER BY last_name ASC;

-- Assuming you have an 'Orders' table with 'order_id', 'customer_id', 'order_date', and 'order_value' columns:
---- Calculating the total revenue, average order value, and the highest and lowest order values
SELECT
  SUM(order_value) AS total_revenue,
  AVG(order_value) AS average_order_value,
  MAX(order_value) AS highest_order_value,
  MIN(order_value) AS lowest_order_value
FROM Orders;
