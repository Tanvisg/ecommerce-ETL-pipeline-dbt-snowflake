-- WITH src_customers AS (
--     SELECT * FROM {{ ref('src_customers') }}
-- )

-- SELECT 
--     customer_id,
--     customer_name,
--     email,
--     phone,
--     country,
--     city,
--     gender,
--     birth_date,
--     signup_date,
--     loyalty_tier,
--     is_active,
-- FROM src_customers

SELECT
    customer_id,
    customer_name,
    email,
    phone,
    country,
    city,
    gender,
    birth_date,
    signup_date,
    loyalty_tier,
    is_active,
    CASE
        WHEN country IN ('India') THEN 'South Asia'
        WHEN country IN ('UAE') THEN 'Middle East'
        WHEN country IN ('USA', 'Canada') THEN 'North America'
        WHEN country = 'Brazil' THEN 'Latin America'
        WHEN country IN ('Japan', 'Australia') THEN 'Asia Pacific'
        ELSE 'Europe'
    END AS region

FROM {{ ref('src_customers') }}