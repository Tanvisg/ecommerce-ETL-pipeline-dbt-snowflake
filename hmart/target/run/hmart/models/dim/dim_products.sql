
  
    

        create or replace transient table HMART.DEV.dim_products
         as
        (SELECT
    product_id,
    sku,
    product_name,
    category,
    subcategory,
    brand,
    unit_cost,
    unit_price,

    ROUND(
        100 * (unit_price - unit_cost) / unit_price,
        2
    ) AS margin_pct,

    CASE
        WHEN unit_price < 25 THEN 'Budget'
        WHEN unit_price < 100 THEN 'Mid'
        WHEN unit_price < 400 THEN 'Premium'
        ELSE 'Luxury'
    END AS price_band,

    weight_kg,
    created_at,
    is_discontinued

FROM HMART.DEV.src_products
        );
      
  