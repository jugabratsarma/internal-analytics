WITH orders AS(
    
    SELECT * FROM {{ ref("stg_orders") }}
),

payments AS(
    
    SELECT * FROM {{ ref("stg_payments") }}
),

order_payments AS (
    
    SELECT order_id,
    SUM(
        CASE WHEN status = 'success' THEN amount END
    ) AS amount
    FROM payments
    GROUP BY order_id
),

final AS (
    SELECT
        t1.order_id,
        t1.customer_id,
        t1.order_date,
        COALESCE(t2.amount,0) AS amount
    FROM orders t1
    LEFT JOIN order_payments t2
    on t1.order_id = t2.order_id
)

SELECT * FROM final