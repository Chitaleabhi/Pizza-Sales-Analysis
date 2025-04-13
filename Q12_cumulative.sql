-- Analyze the cumulative revenue generated over time.

select o.order_date , 
round(sum(od.quantity*p.price),2) as daily_revenue, 
round(sum(sum(od.quantity*p.price)) over(order by o.order_date),2) as cumulative_revenue
from orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;