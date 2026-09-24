{% snapshot snap_customers %}

{{
    config(
        target_schema='SNAPSHOTS',
        unique_key='customer_id',
        strategy='check',
        check_cols=[
            'first_name',
            'last_name',
            'email',
            'phone',
            'country',
            'city',
            'loyalty_tier',
            'is_active'
        ]
    )
}}

SELECT *
FROM {{ ref('src_customers') }}

{% endsnapshot %}