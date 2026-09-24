WITH src_order_items AS (
    SELECT * FROM HMART.RAW.RAW_ORDER_ITEMS
)

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    discount_pct,
    line_total
FROM src_order_items