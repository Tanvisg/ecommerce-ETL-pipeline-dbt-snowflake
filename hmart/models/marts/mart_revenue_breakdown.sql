SELECT
    DATE_TRUNC('month', f.order_ts)::DATE AS month_start,
    p.category,
    f.channel,
    c.country,
    c.region,

    COUNT(DISTINCT f.order_id) AS orders,
    SUM(f.quantity) AS units,
    ROUND(SUM(f.net_amount), 2) AS net_revenue,
    ROUND(SUM(f.gross_margin), 2) AS gross_margin

FROM {{ ref('fct_sales') }} f

JOIN {{ ref('dim_products') }} p
    ON p.product_id = f.product_id

JOIN {{ ref('dim_customers') }} c
    ON c.customer_id = f.customer_id

WHERE f.is_revenue

GROUP BY 1, 2, 3, 4, 5