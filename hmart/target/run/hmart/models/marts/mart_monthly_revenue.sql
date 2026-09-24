
  
    

        create or replace transient table HMART.DEV.mart_monthly_revenue
         as
        (SELECT
    DATE_TRUNC('month', order_ts)::DATE AS month_start,
    COUNT(*) AS orders,
    COUNT(DISTINCT customer_id) AS active_customers,
    SUM(units) AS units,
    ROUND(SUM(net_amount), 2) AS net_revenue,
    ROUND(SUM(gross_margin), 2) AS gross_margin,
    ROUND(SUM(discount_amount), 2) AS discounts,
    ROUND(SUM(net_amount) / COUNT(*), 2) AS avg_order_value,
    ROUND(100 * SUM(gross_margin) / NULLIF(SUM(net_amount), 0), 2) AS margin_pct

FROM HMART.DEV.fct_orders

WHERE is_revenue

GROUP BY 1
ORDER BY 1
        );
      
  