WITH source AS (

    SELECT *
    FROM {{ source('bronze', 'order_items_raw') }}

),

cleaned AS (

    SELECT
        TRIM(order_item_id) AS order_item_id,
        TRIM(order_id) AS order_id,
        TRIM(product_id) AS product_id,
        TRIM(seller_id) AS seller_id,
        quantity,
        unit_price
    FROM source

)

SELECT *
FROM cleaned