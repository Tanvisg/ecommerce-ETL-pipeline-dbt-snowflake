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

| Technology       | Purpose                          |
| ---------------- | -------------------------------- |
| **Amazon S3**    | Cloud storage for raw data       |
| **Snowflake**    | Cloud data warehouse             |
| **dbt**          | Data transformation and modeling |
| **SQL**          | Data transformation and analysis |
| **Git & GitHub** | Version control                  |
