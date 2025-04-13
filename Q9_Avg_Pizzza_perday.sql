-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(quantity), 2) AS avg_pizza_per_day
FROM
    (SELECT 
        order_date, SUM(quantity) AS quantity
    FROM
        orders o
    INNER JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_date) AS order_quantity;
    
