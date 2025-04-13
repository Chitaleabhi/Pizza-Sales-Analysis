-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.name AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS revenue,
    ROUND((SUM(od.quantity * p.price) * 100) / (SELECT 
                    SUM(od2.quantity * p2.price)
                FROM
                    order_details od2
                        JOIN
                    pizzas p2 ON od2.pizza_id = p2.pizza_id),
            2) AS revenue_percentage
FROM
    order_details od
        INNER JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        INNER JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_percentage DESC;
