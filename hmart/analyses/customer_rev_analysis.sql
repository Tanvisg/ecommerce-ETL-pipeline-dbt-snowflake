-- Customer Revenue Analysis
-- Identifies customers generating the highest revenue and margin

WITH customer_sales AS (

    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS orders,
        SUM(quantity) AS units,
        ROUND(SUM(net_amount), 2) AS revenue,
        ROUND(SUM(gross_margin), 2) AS gross_margin

    FROM {{ ref('fct_sales') }}

    WHERE is_revenue

    GROUP BY customer_id
)

SELECT
    c.customer_id,
    c.full_name,
    c.country,
    c.loyalty_tier,

    s.orders,
    s.units,
    s.revenue,
    s.gross_margin,

    ROUND(
        100 * s.gross_margin / NULLIF(s.revenue, 0),
        2
    ) AS margin_pct

FROM customer_sales s

JOIN {{ ref('dim_customers') }} c
    ON c.customer_id = s.customer_id

ORDER BY revenue DESC;