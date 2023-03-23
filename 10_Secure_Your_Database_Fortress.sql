--* User Management *--
-- 1: Create a new user with limited privileges

CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'StrongPassword123!';

-- Step 2: Grant necessary privileges to the new user (e.g., SELECT and INSERT on the 'Customers' table)
GRANT SELECT, INSERT ON your_database.Customers TO 'new_user'@'localhost';

-- Step 3: Set a strong password policy (minimum length, complexity, and expiration)
SET GLOBAL validate_password.length = 12;
SET GLOBAL validate_password.number_count = 2;
SET GLOBAL validate_password.policy = STRONG;
SET GLOBAL default_password_lifetime = 90;

--* Access Control *--
-- Step 1: Restrict remote access for a user account to a specific IP address
CREATE USER 'restricted_user'@'192.168.1.100' IDENTIFIED BY 'SecurePassword321!';

-- Step 2: Grant only the required privileges (e.g., SELECT and UPDATE on the 'Customers' table)
GRANT SELECT, UPDATE ON your_database.Customers TO 'restricted_user'@'192.168.1.100';

--* Encryption *--
-- Step 1: Configure SSL/TLS for MySQL connections
---> Obtain SSL certificates (CA, server, and client certificates)
---> Add the following lines to the MySQL server configuration file (my.cnf or my.ini), replacing the paths with your certificate paths:

[mysqld]
ssl_ca = /path/to/ca.pem
ssl_cert = /path/to/server-cert.pem
ssl_key = /path/to/server-key.pem

-- Restart the MySQL server for the changes to take effect

-- Step 2: Connect to the MySQL server using SSL/TLS
mysql --ssl-mode=REQUIRED --user=your_username --password=your_password --host=localhost

-- Step 3: Use built-in encryption functions to protect sensitive data
---> Encrypt data using AES_ENCRYPT:
INSERT INTO your_table (encrypted_data) VALUES (AES_ENCRYPT('Sensitive data', 'encryption_key'));

-- Decrypt data using AES_DECRYPT:
SELECT AES_DECRYPT(encrypted_data, 'encryption_key') AS decrypted_data FROM your_table;