
-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    ROUND(((ROUND(SUM(od.quantity * p.price), 2) / (SELECT 
                    ROUND(SUM(od.quantity * p.price), 2)
                FROM
                    order_details AS od
                        JOIN
                    pizzas AS p ON p.pizza_id = od.pizza_id)) * 100),
            2) AS total_revenue,
    pt.category
FROM
    order_details AS od
        JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.category
ORDER BY total_revenue DESC;

-- Analyze the cumulative revenue generated over time.
select *, round(sum(revenue) over (ORDER BY order_date),2) as cumulative_revenue
 from (select o.order_date order_date, 
round(sum(od.quantity*p.price),2) as revenue
 from orders as o
join order_details od on od.order_id = o.order_id
join pizzas p on p.pizza_id = od.pizza_id
group by order_date) as per_day_revenue;

-- Determine the top 3 most ordered pizza types 
-- based on revenue for each pizza category.

select * from (select category, name, revenue, 
rank() over(PARTITION BY category order by revenue desc ) as result 
from (
select sum(od.quantity*p.price) revenue, pt.name, pt.category  from order_details od
join pizzas as p on p.pizza_id = od.pizza_id
join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
group by pt.name, pt.category
order by pt.category, revenue desc ) as raw_data) rank_data
where result <=3

