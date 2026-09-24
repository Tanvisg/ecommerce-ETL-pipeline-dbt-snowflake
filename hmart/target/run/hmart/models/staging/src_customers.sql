
  create or replace   view HMART.DEV.src_customers
  
   as (
    WITH raw_customers as (
    SELECT * FROM HMART.RAW.RAW_CUSTOMERS
)

SELECT customer_id,
    CONCAT(first_name, ' ', last_name) as customer_name,
    email,
    phone,
    country,
    city,
    gender,
    birth_date,
    signup_date,
    loyalty_tier,
    is_active,
    email_missing
FROM raw_customers
  );

