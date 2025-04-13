-- Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(od.order_id) AS common_pizza
FROM
    pizzas p
        INNER JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY common_pizza DESC
LIMIT 1;
