with source as (
select * from {{ source('bronze','products_raw') }}
),
cleaned as 
(
select TRIM(product_id) as product_id,
TRIM(product_name) as product_name,
TRIM(category) as category,
unit_price,
TRIM(brand) as brand
from source
)
select * from cleaned