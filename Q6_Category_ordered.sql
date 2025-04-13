-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category, SUM(od.quantity) AS Total_Quantity
FROM
    order_details od
        INNER JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        INNER JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;