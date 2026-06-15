-- Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;

-- Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(p.price * od.quantity), 2) AS total_revenue
FROM
    order_details od
        INNER JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id;
    
    
-- Identify the highest-priced pizza.
SELECT 
    p.price AS hightest_price, pt.name
FROM
    pizzas AS p
        INNER JOIN
    pizza_types AS pt ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT 
    COUNT(od.order_details_id) AS order_count, p.size
FROM
    order_details AS od
        INNER JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY order_count desc
LIMIT 1;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    SUM(od.quantity) AS quantity, pt.name
FROM
    order_details AS od
        INNER JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id
        INNER JOIN
    pizza_types AS pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.name
ORDER BY quantity DESC
LIMIT 5


