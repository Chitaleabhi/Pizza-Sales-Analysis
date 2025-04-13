-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.


select category, name as pizza_type,
revenue
from
(
select pt.category ,pt.name, sum(od.quantity*p.price) as Revenue,
rank() over(partition by pt.category order by SUM(od.quantity * p.price) DESC ) as ranked from 
order_details od 
inner join pizzas p 
on od.pizza_id = p.pizza_id
inner join pizza_types pt 
on p.pizza_type_id = pt.pizza_type_id 
group by pt.category , pt.name ) ranked_pizzas 
where ranked <=3

order by category , revenue desc
;