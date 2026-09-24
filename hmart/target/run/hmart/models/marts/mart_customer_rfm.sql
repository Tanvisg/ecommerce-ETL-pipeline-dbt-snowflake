
  
    

        create or replace transient table HMART.DEV.mart_customer_rfm
         as
        (WITH customer_sales AS (

    SELECT
        customer_id,
        MAX(order_ts)::DATE AS last_order_date,
        COUNT(*) AS frequency,
        ROUND(SUM(net_amount), 2) AS monetary

    FROM HMART.DEV.fct_orders

    WHERE is_revenue

    GROUP BY customer_id
)

SELECT
    customer_id,
    last_order_date,
    frequency,
    monetary,

    DATEDIFF('day', last_order_date, CURRENT_DATE()) AS recency_days,

    CASE
        WHEN frequency >= 5 AND monetary >= 1000 THEN 'High Value'
        WHEN frequency >= 3 THEN 'Loyal'
        WHEN DATEDIFF('day', last_order_date, CURRENT_DATE()) > 180 THEN 'At Risk'
        ELSE 'Regular'
    END AS customer_segment

FROM customer_sales
        );
      
  