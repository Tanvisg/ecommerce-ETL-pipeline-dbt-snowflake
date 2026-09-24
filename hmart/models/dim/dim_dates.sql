{{ config(
    materialized='ephemeral'
) }}

WITH dates AS (
    SELECT DATEADD(DAY, SEQ4(), '2021-01-01') AS date
    FROM TABLE(GENERATOR(ROWCOUNT => 2191))
)

SELECT
    TO_NUMBER(TO_CHAR(date, 'YYYYMMDD')) AS date_key,
    date,
    YEAR(date) AS year,
    MONTH(date) AS month,
    MONTHNAME(date) AS month_name,
    QUARTER(date) AS quarter,
    WEEKOFYEAR(date) AS week,
    DAYOFWEEK(date) AS day_of_week,
    DAYNAME(date) AS day_name,
    DAYOFWEEK(date) IN (1, 7) AS is_weekend
FROM dates