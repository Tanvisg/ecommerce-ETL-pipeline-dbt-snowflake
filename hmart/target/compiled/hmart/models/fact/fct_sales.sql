

WITH sales AS (

    SELECT
        oi.order_item_id,
        oi.order_id,
        TO_NUMBER(TO_CHAR(o.order_ts, 'YYYYMMDD')) AS date_key,
        o.order_ts,
        c.customer_id,
        p.product_id,
        o.channel,
        o.status,
        o.coupon_code,
        pay.method AS payment_method,
        oi.quantity,
        oi.unit_price,
        oi.discount_pct,
        oi.quantity * oi.unit_price AS gross_amount,
        oi.line_total AS net_amount,
        oi.quantity * p.unit_cost AS cost_amount

    FROM HMART.DEV.src_order_items oi

    JOIN HMART.DEV.src_orders o
        ON o.order_id = oi.order_id

    JOIN HMART.DEV.src_payments pay
        ON pay.order_id = oi.order_id

    JOIN HMART.DEV.dim_customers c
        ON c.customer_id = o.customer_id

    JOIN HMART.DEV.dim_products p
        ON p.product_id = oi.product_id

    
    WHERE o.order_ts > (
        SELECT MAX(order_ts)
        FROM HMART.DEV.fct_sales
    )
    
)

SELECT
    order_item_id,
    order_id,
    date_key,
    order_ts,
    customer_id,
    product_id,
    channel,
    status,
    coupon_code,
    payment_method,
    quantity,
    unit_price,
    discount_pct,
    ROUND(gross_amount, 2) AS gross_amount,
    ROUND(gross_amount - net_amount, 2) AS discount_amount,
    ROUND(net_amount, 2) AS net_amount,
    ROUND(cost_amount, 2) AS cost_amount,
    ROUND(net_amount - cost_amount, 2) AS gross_margin,
    status IN ('delivered', 'shipped', 'processing') AS is_revenue

FROM sales