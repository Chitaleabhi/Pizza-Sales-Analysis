-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pt.name, SUM(od.quantity) AS Total_Quantity
FROM
    order_details od
        INNER JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        INNER JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY Total_Quantity DESC
LIMIT 5;