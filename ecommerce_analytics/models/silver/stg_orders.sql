with source as (

select * from {{source('bronze','orders_raw')}}

),
cleaned as (
select TRIM(order_id) as order_id,
TRIM(customer_id) as customer_id,
order_date,
TRIM(order_status) as order_status
from source
)
select * from cleaned