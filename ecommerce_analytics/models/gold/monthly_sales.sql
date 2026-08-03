with sales as
(
	select * from {{ ref('sales_summary') }}
)
select 
	date_trunc('month',order_date) as sales_month,
	sum(total_sales) as monthly_sales,
	count(order_id) as total_orders
from sales
group by date_trunc('month',order_date)
order by sales_month