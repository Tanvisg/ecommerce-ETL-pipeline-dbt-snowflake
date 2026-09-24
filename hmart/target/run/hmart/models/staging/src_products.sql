
  create or replace   view HMART.DEV.src_products
  
   as (
    WITH src_products as (
    SELECT * FROM HMART.RAW.RAW_PRODUCTS
)

SELECT 
    product_id,
    sku,
    product_name,
    category,
    subcategory,
    brand,
    unit_cost,
    unit_price,
    weight_kg,
    created_at,
    is_discontinued,
    price_imputed
FROM src_products
  );

