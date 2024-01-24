WITH orders AS (
  SELECT 
    ID AS order_id,
    USER_ID AS customer_id,
    order_date,
    status
  FROM `raw-data-411921.jaffle_shop.orders`
)

SELECT * FROM orders