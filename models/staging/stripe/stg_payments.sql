WITH PAYMENT AS(

    SELECT 
        id AS payment_id,
        orderid AS order_id,
        paymentmethod AS payment_method,
        status,
        -- amount is stored in cents hence converting it to dollars
        amount / 100 AS amount
    FROM {{ source("stripe","payment") }}
)

SELECT * FROM PAYMENT