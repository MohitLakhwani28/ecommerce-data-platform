with source as (

select * from {{ source('bronze','payments_raw') }}

),
cleaned as (
select TRIM(payment_id) as payment_id,
TRIM(order_id) as order_id,
TRIM(payment_method) as payment_method,
payment_amount,
payment_date
from source
)
select * from cleaned