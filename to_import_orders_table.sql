SELECT * FROM pizzahut.orders;

SELECT @@autocommit;

SET autocommit = 1;

SHOW CREATE TABLE orders;

TRUNCATE table orders;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_date, order_time);

SHOW VARIABLES LIKE 'secure_file_priv';