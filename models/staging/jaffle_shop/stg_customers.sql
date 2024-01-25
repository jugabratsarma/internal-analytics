WITH customers AS (
  
  SELECT 
    ID AS customer_id,
    first_name, 
    last_name
  FROM {{ source('jaffle_shop', 'customers') }}
)

SELECT * FROM customers