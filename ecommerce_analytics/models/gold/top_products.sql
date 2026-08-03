with order_items as
(
	select 
		product_id,
		quantity,
		unit_price
		from {{ ref('stg_order_items') }}
),
products as
(
select product_id,
       product_name,
       category,
       brand,
       from {{ref('stg_products')}}
)
select 
	p.product_id,
	p.product_name,
	p.category,
	p.brand,
	sum(oi.quantity) as total_quantity_sold,
	sum(oi.quantity*oi.unit_price) as total_revenue
from products p 
join order_items oi
on p.product_id = oi.product_id
group by 
p.product_id,
p.product_name,
p.category,
p.brand
order by total_revenue desc
