WITH customer_orders AS (

    SELECT
        customer_id,
        DATE_TRUNC('month', order_ts)::DATE AS order_month

    FROM {{ ref('fct_orders') }}

    WHERE is_revenue

    GROUP BY 1, 2
),

cohorts AS (

    SELECT
        customer_id,
        MIN(order_month) AS cohort_month

    FROM customer_orders

    GROUP BY customer_id
)

SELECT
    c.cohort_month,
    o.order_month,
    COUNT(DISTINCT o.customer_id) AS active_customers

FROM cohorts c

JOIN customer_orders o
    ON c.customer_id = o.customer_id

GROUP BY 1, 2
ORDER BY 1, 2