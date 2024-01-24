WITH customers AS (
  
  SELECT 
    ID AS customer_id,
    first_name, 
    last_name
  FROM `raw-data-411921.jaffle_shop.customers`
)

SELECT * FROM customers