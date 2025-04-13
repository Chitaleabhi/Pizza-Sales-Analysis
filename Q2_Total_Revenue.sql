-- Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(p.Price * od.quantity), 2) AS total_revenue
FROM
    pizzas p
        INNER JOIN
    order_details od ON p.pizza_id = od.pizza_id;