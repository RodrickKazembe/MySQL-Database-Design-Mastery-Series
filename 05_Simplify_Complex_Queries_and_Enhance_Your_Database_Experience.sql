-- 1. Create a basic view displaying customer names and their total order amounts:
CREATE VIEW customer_total_orders AS
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_order_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 2. Create a complex view using JOINs to display the details of each book and its author:
CREATE VIEW book_author_details AS
SELECT b.book_id, b.title, b.genre, a.author_id, a.first_name, a.last_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

-- 3. Create a complex view using a subquery to display the top-selling books and their total sales:
CREATE VIEW top_selling_books AS
SELECT b.book_id, b.title, SUM(p.quantity) AS total_sales
FROM Books b
JOIN Purchases p ON b.book_id = p.book_id
GROUP BY b.book_id
ORDER BY total_sales DESC;


-- After running these queries, you will have three new views in your database: customer_total_orders, book_author_details, and top_selling_books. You can use these views in your queries just like regular tables.