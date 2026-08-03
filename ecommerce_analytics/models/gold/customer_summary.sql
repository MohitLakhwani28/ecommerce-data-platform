with sales as (
	
select * from {{ref('sales_summary')}}

)
select 
	customer_id,
	count(order_id) as total_orders,
	sum(total_sales) as total_spent,
	avg(total_sales) as avg_order_value
from sales
group by customer_id
order by total_spent desc