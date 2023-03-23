-- 1. Creating a Stored Procedure:
DELIMITER //
CREATE PROCEDURE GetAllCustomers()
BEGIN
  SELECT * FROM Customers;
END //
DELIMITER ;

-- 2. Using a Stored Procedure:
CALL GetAllCustomers();

-- 3. Creating a Function:
DELIMITER //
CREATE FUNCTION TotalSales(p_customer_id INT) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE total_sales DECIMAL(10,2);
  SELECT SUM(order_value) INTO total_sales FROM Orders WHERE Customer_ID = p_customer_id;
  RETURN total_sales;
END //
DELIMITER ;

-- 4. Using a Function:
SELECT Customer_ID, First_Name, Last_Name, TotalSales(Customer_ID) AS Total_Sales FROM Customers;

-- 5. Error Handling and Parameter Passing:
DELIMITER //
CREATE PROCEDURE GetCustomersByLastName(IN search_last_name VARCHAR(255))
BEGIN
  DECLARE exit_handler CONDITION FOR SQLSTATE '02000';
  DECLARE CONTINUE HANDLER FOR exit_handler
    BEGIN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No records found with the specified last name.';
    END;

  IF search_last_name IS NULL THEN
    SELECT * FROM Customers;
  ELSE
    SELECT * FROM Customers WHERE last_name = search_last_name;
  END IF;
END //
DELIMITER ;

-- 6. To call the stored procedure with a parameter:
CALL GetCustomersByLastName('Edison');

-- 7. To call the stored procedure without a parameter:
CALL GetCustomersByLastName(NULL);
