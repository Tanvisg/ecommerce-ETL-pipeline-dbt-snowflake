SELECT
    YEAR(order_ts) AS year,
    channel,
    payment_method,

    COUNT(*) AS orders,

    COUNT_IF(status = 'cancelled') AS cancelled,
    COUNT_IF(status = 'returned') AS returned,

    ROUND(
        100 * COUNT_IF(status = 'cancelled') / COUNT(*),
        2
    ) AS cancel_rate_pct,

    ROUND(
        100 * COUNT_IF(status = 'returned') / COUNT(*),
        2
    ) AS return_rate_pct

FROM {{ ref('fct_orders') }}

GROUP BY 1, 2, 3