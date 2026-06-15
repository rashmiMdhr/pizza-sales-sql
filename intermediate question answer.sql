-- Join the necessary tables to find the total quantity of each pizza category ordered.
select sum(od.quantity) as quantity, pt.category from order_details as od
join pizzas as p on p.pizza_id = od.pizza_id
join pizza_types as pt on pt.pizza_type_id = p.pizza_type_id
group by pt.category;

-- Determine the distribution of orders by hour of the day.
select count(o.order_id) order_count , hour(o.order_time) hours from orders o
group by hour(o.order_time);


-- Join relevant tables to find the category-wise distribution of pizzas.
select count(p.pizza_id) pizza_count, pt.category from pizzas p 
inner join pizza_types as pt on pt.pizza_type_id = p.pizza_type_id
group by pt.category;


-- Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(quantity),0) avg_quantity from 
(select sum(od.quantity) quantity, order_date from order_details od
join orders o on o.order_id = od.order_id
group by o.order_date) as order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.
select round(sum(p.price*od.quantity),2) as revenue, pt.name from order_details od
join pizzas as p on p.pizza_id = od.pizza_id
join pizza_types as pt on pt.pizza_type_id = p.pizza_type_id
group by pt.name
order by revenue  desc limit 3
