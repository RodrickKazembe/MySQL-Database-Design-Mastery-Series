-- 1. Creating a simple view displaying customer names and total order amounts
CREATE VIEW customer_orders_summary AS
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(o.order_value) AS total_order_amount
FROM
  Customers c
  JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY
  c.customer_id;


-- 2. Creating a view displaying book details and their authors
CREATE VIEW book_author_details AS
SELECT
  b.book_id,
  b.title,
  a.author_id,
  a.first_name,
  a.last_name
FROM
  Books b
  JOIN Authors a ON b.author_id = a.author_id;
  
-- 3. Creating a view displaying top-selling books and their total sales
CREATE VIEW top_selling_books AS
SELECT
  b.book_id,
  b.title,
  (
    SELECT SUM(oi.quantity)
    FROM Order_Items oi
    WHERE oi.book_id = b.book_id
  ) AS total_sales
FROM
  Books b
ORDER BY
  total_sales DESC;

-- 4. Updating the top-selling books view to include the author name
ALTER VIEW top_selling_books AS
SELECT
  b.book_id,
  b.title,
  a.first_name,
  a.last_name,
  (
    SELECT SUM(oi.quantity)
    FROM Order_Items oi
    WHERE oi.book_id = b.book_id
  ) AS total_sales
FROM
  Books b
  JOIN Authors a ON b.author_id = a.author_id
ORDER BY
  total_sales DESC;

-- 5. Dropping the view
DROP VIEW top_selling_books;
