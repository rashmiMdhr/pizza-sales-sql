create table orders(
order_id int AUTO_INCREMENT primary key,
order_date date not null,
order_time time not null
);


drop table order_details;

create table order_details(
order_details_id int AUTO_INCREMENT primary key,
order_id int not null,
pizza_id text not null,
quantity int not null
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_details.csv'
INTO TABLE order_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_details_id, order_id, pizza_id, quantity);