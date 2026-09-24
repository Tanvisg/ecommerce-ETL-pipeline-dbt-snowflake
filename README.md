# 🛒 E-Commerce ETL & Analytics Pipeline

An end-to-end **E-Commerce ETL/ELT data pipeline** built using **Amazon S3, Snowflake, dbt, and SQL**.

The project transforms raw E-Commerce data into structured, analytics-ready datasets using modern data engineering and analytics engineering practices.

---

## 🏗️ Architecture

```mermaid
flowchart LR
    A[Raw E-Commerce Data] --> B[Amazon S3]
    B --> C[Snowflake RAW Layer]
    C --> D[dbt Staging Layer]

    D --> E[Dimension Models]
    D --> F[Fact Models]

    E --> G[Analytics Marts]
    F --> G

    G --> H[BI / Analytics]
```

Pipeline Flow

Raw Data → Amazon S3 → Snowflake → dbt Staging → Dimensions & Facts → Analytics Marts → BI / Analytics
