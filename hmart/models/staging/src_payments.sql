WITH src_payments AS (
    SELECT * FROM HMART.RAW.RAW_PAYMENTS
)

SELECT 
    payment_id,
    order_id,
    method,
    amount,
    currency,
    payment_status,
    amount_recomputed 
FROM src_payments