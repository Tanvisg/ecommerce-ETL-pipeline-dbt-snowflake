SELECT
    order_id,

    MIN(date_key) AS date_key,
    MIN(order_ts) AS order_ts,
    MIN(customer_id) AS customer_id,
    MIN(channel) AS channel,
    MIN(status) AS status,
    MIN(payment_method) AS payment_method,
    MIN(coupon_code) AS coupon_code,

    COUNT(*) AS line_count,
    SUM(quantity) AS units,
    SUM(gross_amount) AS gross_amount,
    SUM(discount_amount) AS discount_amount,
    SUM(net_amount) AS net_amount,
    SUM(cost_amount) AS cost_amount,
    SUM(gross_margin) AS gross_margin,

    MAX(is_revenue) AS is_revenue

FROM HMART.DEV.fct_sales

GROUP BY order_id