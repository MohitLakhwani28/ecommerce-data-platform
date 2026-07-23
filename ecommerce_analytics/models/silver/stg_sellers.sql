WITH source AS (

    SELECT *
    FROM {{ source('bronze', 'sellers_raw') }}

),

cleaned AS (

    SELECT
        TRIM(seller_id) AS seller_id,
        TRIM(seller_name) AS seller_name,
        TRIM(city) AS city,
        TRIM(state) AS state
    FROM source

)

SELECT *
FROM cleaned