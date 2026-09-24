SELECT
    COALESCE(coupon_code, 'NONE') AS coupon_code,

    COUNT(*) AS orders,
    ROUND(SUM(net_amount), 2) AS revenue,
    ROUND(AVG(net_amount), 2) AS avg_order_value,
    ROUND(SUM(discount_amount), 2) AS total_discounts,
    ROUND(SUM(gross_margin), 2) AS gross_margin

FROM {{ ref('fct_orders') }}

WHERE is_revenue

GROUP BY 1
ORDER BY orders DESC