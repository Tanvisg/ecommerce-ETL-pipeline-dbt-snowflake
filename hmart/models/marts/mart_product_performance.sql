SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.subcategory,
    p.brand,

    SUM(f.quantity) AS units,
    ROUND(SUM(f.net_amount), 2) AS revenue,
    ROUND(SUM(f.gross_margin), 2) AS gross_margin,

    ROUND(
        100 * SUM(f.gross_margin) / NULLIF(SUM(f.net_amount), 0),
        2
    ) AS margin_pct

FROM {{ ref('fct_sales') }} f

JOIN {{ ref('dim_products') }} p
    ON p.product_id = f.product_id

WHERE f.is_revenue

GROUP BY
    p.product_id,
    p.product_name,
    p.category,
    p.subcategory,
    p.brand