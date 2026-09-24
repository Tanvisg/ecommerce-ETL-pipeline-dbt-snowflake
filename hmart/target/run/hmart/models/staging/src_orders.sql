
  create or replace   view HMART.DEV.src_orders
  
   as (
    WITH src_orders AS (
    SELECT * FROM HMART.RAW.RAW_ORDERS
)

SELECT 
    order_id,
    customer_id,
    order_ts,
    status,
    channel,
    shipping_country,
    coupon_code
FROM src_orders
  );

