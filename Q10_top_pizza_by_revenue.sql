-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name, SUM(od.quantity * p.price) AS revenue
FROM
    order_details od
        INNER JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        INNER JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;