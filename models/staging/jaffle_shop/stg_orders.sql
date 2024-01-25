WITH orders AS (
  SELECT 
    ID AS order_id,
    USER_ID AS customer_id,
    order_date,
    status
  FROM {{ source('jaffle_shop', 'orders') }}
)

SELECT * FROM orders