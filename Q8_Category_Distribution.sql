-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    pt.category, COUNT(od.order_id) AS total_orders
FROM
    pizza_types pt
        INNER JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        INNER JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category;