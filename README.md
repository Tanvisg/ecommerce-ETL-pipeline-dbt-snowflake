# 🛒 E-Commerce ETL & Analytics Pipeline

An end-to-end **E-Commerce ETL/ELT pipeline** built using **Amazon S3, Snowflake, dbt, and SQL**.

This project transforms raw E-Commerce data into analytics-ready datasets using dimensional modeling, incremental processing, snapshots, and data quality testing.

## 🛠️ Tech Stack

- **Amazon S3** — Raw data storage
- **Snowflake** — Cloud data warehouse
- **dbt** — Data transformation, testing, snapshots, and documentation
- **SQL** — Data transformation and analysis
- **Git & GitHub** — Version control

## 🏗️ Project Architecture

The pipeline follows a layered ELT architecture:

**Amazon S3 → Snowflake → dbt Staging → Dimensions & Facts → Analytics Marts**

- **Raw Layer** — Raw E-Commerce data stored in Amazon S3
- **Staging Layer** — Source data cleaned and standardized
- **Core Layer** — Dimension and fact tables created using dimensional modeling
- **Marts Layer** — Business-ready datasets for analytics and reporting

## 📂 Project Structure

```text
hmart/
│
├── models/
│   ├── staging/
│   │   ├── src_customers.sql
│   │   ├── src_products.sql
│   │   ├── src_orders.sql
│   │   ├── src_order_items.sql
│   │   └── src_payments.sql
│   │
│   ├── dimensions/
│   │   ├── dim_customers.sql
│   │   ├── dim_products.sql
│   │   └── dim_dates.sql
│   │
│   ├── facts/
│   │   ├── fct_sales.sql
│   │   └── fct_orders.sql
│   │
│   └── marts/
│       ├── mart_monthly_revenue.sql
│       ├── mart_revenue_breakdown.sql
│       ├── mart_customer_rfm.sql
│       ├── mart_cohort_retention.sql
│       ├── mart_product_performance.sql
│       ├── mart_coupon_effectiveness.sql
│       └── mart_order_status_rates.sql
│
├── snapshots/
│   ├── snap_customers.sql
│   └── snap_products.sql
│
├── tests/
│   └── assert_net_amount_not_greater_than_gross.sql
│
├── analyses/
│   └── customer_revenue_analysis.sql
│
├── dbt_project.yml
└── packages.yml
```


## 🧩 Data Modeling

The project uses a dimensional modeling approach with separate **dimension**, **fact**, and **analytics mart** layers.

### Dimensions

- `dim_customers` — Customer attributes
- `dim_products` — Product attributes
- `dim_dates` — Date dimension for time-based analysis

### Facts

- `fct_sales` — Order-item level sales transactions
- `fct_orders` — Order-level metrics

### Analytics Marts

- Monthly revenue analysis
- Revenue breakdown
- Customer RFM segmentation
- Cohort retention
- Product performance
- Coupon effectiveness
- Order status analysis

## ⚙️ Key dbt Features

- **Incremental Models** — Incremental processing for `fct_sales` to improve efficiency as data grows
- **Snapshots** — Historical tracking of customer and product changes
- **Data Quality Tests** — Built-in and custom tests for validating data integrity
- **Jinja & dbt Macros** — Reusable SQL logic and dynamic transformations
- **Dependencies** — Managed using `dbt deps`
- **Documentation** — Generated using dbt documentation


## 📊 Analytics

The analytics marts are designed to answer common e-commerce business questions:

| Mart | Purpose |
|---|---|
| Monthly Revenue | Track revenue trends over time |
| Revenue Breakdown | Analyze revenue across business dimensions |
| Customer RFM | Segment customers based on Recency, Frequency, and Monetary value |
| Cohort Retention | Analyze customer retention by acquisition cohort |
| Product Performance | Evaluate product-level sales performance |
| Coupon Effectiveness | Measure coupon usage and impact |
| Order Status Rates | Analyze order completion and status patterns |



