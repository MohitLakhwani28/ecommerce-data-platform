with source as (
select * from {{ source('bronze','customers_raw') }}
),
cleaned as (
select TRIM(customer_id) as customer_id,
TRIM(customer_name) as customer_name ,
LOWER(TRIM(email)) as email,
TRIM(city) as city,
TRIM(state) as state,
signup_date
from source
)
select * from cleaned