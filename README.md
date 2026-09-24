# 🛒 E-Commerce ETL & Analytics Pipeline

An end-to-end **E-Commerce data engineering and analytics pipeline** built using **Amazon S3, Snowflake, and dbt**.

The project demonstrates how raw e-commerce data can be ingested, transformed, tested, modeled into a dimensional warehouse, and prepared for analytics.

---

## 🏗️ Architecture

```mermaid
flowchart LR

    A[Raw E-Commerce Data] --> B[Amazon S3]

    B --> C[Snowflake RAW Layer]

    C --> D[dbt Staging]

    D --> E[Dimensions]
    D --> F[Facts]

    E --> G[Analytics Marts]
    F --> G

    G --> H[BI / Analytics]

Source Data
     │
     ▼
Amazon S3
     │
     ▼
Snowflake RAW
     │
     ▼
dbt Staging
     │
     ├──────────────┐
     ▼              ▼
Dimensions       Fact Tables
     │              │
     └──────┬───────┘
            ▼
      Analytics Marts
            │
            ▼
       BI / Reporting

🛠️ Tech Stack
Technology	Purpose
Amazon S3	Cloud storage for raw data
Snowflake	Cloud data warehouse
dbt	Data transformation and modeling
SQL	Data transformation and analysis
Git & GitHub	Version control
📂 Project Structure
hmart/
│
├── analyses/
│
├── macros/
│
├── models/
│   │
│   ├── staging/
│   │   ├── src_customers.sql
│   │   ├── src_products.sql
│   │   ├── src_orders.sql
│   │   ├── src_order_items.sql
│   │   └── src_payments.sql
│   │
│   ├── dim/
│   │   ├── dim_customers.sql
│   │   ├── dim_products.sql
│   │   └── dim_dates.sql
│   │
│   ├── fact/
│   │   ├── fct_orders.sql
│   │   └── fct_sales.sql
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
│
├── seeds/
│
├── tests/
│
├── dbt_project.yml
├── packages.yml
└── README.md
🔄 Data Pipeline
1. Data Ingestion

Raw e-commerce datasets are stored in Amazon S3.

The raw data includes information related to:

Customers
Products
Orders
Order Items
Payments
Web Events
2. Staging Layer

The staging layer creates clean and standardized versions of the raw tables.

Examples:

src_customers
src_products
src_orders
src_order_items
src_payments

Typical transformations include:

Column standardization
Data type conversion
Derived fields
Basic data cleaning
3. Dimensional Model

The warehouse follows a simplified star schema.

Dimension Tables
dim_customers

Contains customer attributes such as:

Customer
Location
Gender
Loyalty Tier
Signup Date
Active Status
dim_products

Contains:

Product
Category
Subcategory
Brand
Cost
Price
Price Band
dim_dates

Provides calendar attributes for time-based analysis.

Fact Tables
fct_sales

Grain:

One row per order item

Contains:

Quantity
Unit Price
Gross Revenue
Discounts
Net Revenue
Cost
Gross Margin
fct_orders

Grain:

One row per order

Contains aggregated order-level metrics.

📊 Analytics Marts

The marts layer contains business-ready datasets for analysis.

Monthly Revenue

Tracks:

Monthly revenue
Orders
Active customers
Units sold
Gross margin
Average order value
Margin %
Revenue Breakdown

Analyzes revenue by:

Category
Channel
Country
Region
Month
Customer RFM

Customer segmentation using:

Recency
Frequency
Monetary value
Cohort Retention

Analyzes customer activity based on their first purchase month.

Product Performance

Tracks:

Revenue
Units sold
Gross margin
Margin %
Coupon Effectiveness

Measures:

Orders
Revenue
Discounts
Average order value
Gross margin
Order Status Analysis

Tracks:

Orders
Cancelled orders
Returned orders
Cancellation rate
Return rate
📸 Data Model

Add your warehouse diagram here:

![Data Model](docs/images/data-model.png)

Recommended diagram:

                    ┌─────────────────┐
                    │  DIM_CUSTOMERS  │
                    └────────┬────────┘
                             │
                             │
┌──────────────┐      ┌──────▼───────┐      ┌──────────────┐
│ DIM_PRODUCTS │─────▶│  FCT_SALES   │◀─────│  DIM_DATES   │
└──────────────┘      └──────┬───────┘      └──────────────┘
                             │
                             │
                      ┌──────▼───────┐
                      │  FCT_ORDERS  │
                      └──────────────┘
⚡ dbt Features Used

This project demonstrates several dbt features:

Models

Staging → Dimensions → Facts → Marts

ref()

Models are connected using dbt's dependency system:

{{ ref('src_customers') }}
Tests

Data quality tests include:

not_null
unique
Snapshots

Snapshots are used to preserve historical changes in slowly changing data such as:

Customers
Products
Incremental Models

Large transactional tables such as fct_sales can be processed incrementally instead of rebuilding the entire table.

First Run
    ↓
Full Load

Future Runs
    ↓
Only New / Changed Records
Materializations

The project uses different dbt materializations depending on the model's purpose:

Views
Tables
Incremental
Ephemeral
Snapshots
🧪 Data Quality

Run dbt tests with:

dbt test

Run the complete project:

dbt build

Run a specific model:

dbt run --select fct_sales

Run snapshots:

dbt snapshot

Generate documentation:

dbt docs generate

Serve documentation locally:

dbt docs serve
🔐 Configuration

Snowflake credentials are stored outside the project in the dbt profiles.yml file.

Sensitive credentials are not committed to GitHub.

Example configuration:

hmart:
  target: dev

  outputs:
    dev:
      type: snowflake
      account: <account>
      user: <user>
      password: <password>
      role: <role>
      database: HMART
      warehouse: <warehouse>
      schema: DEV
📈 Key Concepts Demonstrated

This project demonstrates practical experience with:

ETL / ELT pipelines
Cloud storage
Snowflake data warehousing
Dimensional modeling
Star schema
Fact and dimension tables
dbt transformations
Incremental models
dbt snapshots
Data quality testing
SQL analytics
Customer segmentation
Cohort analysis
Revenue analysis
Git version control
🚀 Future Improvements

Potential extensions include:

Add Power BI / Tableau dashboards
Add automated CI/CD with GitHub Actions
Add more dbt tests
Add source freshness checks
Add automated S3 → Snowflake ingestion
Add monitoring and pipeline alerts
Add additional customer and product analytics
👩‍💻 Author

Tanvi Bhatmbare

Built as an end-to-end data engineering and analytics project using:

Amazon S3 → Snowflake → dbt → Analytics

