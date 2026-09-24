{% snapshot snap_products %}

{{
    config(
        target_schema='SNAPSHOTS',
        unique_key='product_id',
        strategy='check',
        check_cols=[
            'product_name',
            'category',
            'subcategory',
            'brand',
            'unit_cost',
            'unit_price',
            'weight_kg',
            'is_discontinued'
        ]
    )
}}

SELECT *
FROM {{ ref('src_products') }}

{% endsnapshot %}