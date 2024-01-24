WITH customers AS (
  
  SELECT 
    ID AS customer_id,
    first_name, 
    last_name
  FROM `raw-data-411921.jaffle_shop.customers`
),

orders AS (
  SELECT 
    ID AS order_id,
    USER_ID AS customer_id,
    order_date,
    status
  FROM `raw-data-411921.jaffle_shop.orders`
),

customer_orders AS (
  
  SELECT customer_id,
  MIN(order_date) AS first_order_date,
  MAX(order_date) AS most_recent_order_date,
  COUNT(order_id) AS number_of_orders

FROM orders
GROUP BY orders.customer_id
),

final AS (
  SELECT
    t1.customer_id,
    t1.first_name,
    t1.last_name,
    t2.first_order_date,
    t2.most_recent_order_date,
    COALESCE(t2.number_of_orders,0) AS number_of_orders
  FROM customers t1 LEFT JOIN customer_orders t2
  ON t1.customer_id = t2.customer_id
)

SELECT 
  * 
FROM final
ORDER BY final.customer_id
