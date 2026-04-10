# E-commerce Analytics Pipeline 

## Overview
This project builds an end-to-end analytics pipeline for an e-commerce business.

It transforms raw transactional data into a structured data warehouse using dbt and BigQuery, and delivers business-ready insights through a Power BI dashboard.

The focus is on designing a scalable analytics layer and analyzing key metrics such as revenue (GMV), order behavior, and payment patterns to support data-driven decision-making.

---

## Architecture

Raw Data → dbt (Staging) → dbt (Marts / Star Schema) → BigQuery → Power BI Dashboard

- **BigQuery**: Data warehouse
- **dbt**: Data transformation & modeling
- **Power BI**: Visualization layer

---

## Data Modeling (dbt)

The warehouse is designed using a **star schema**, separating facts and dimensions to preserve data granularity and enable flexible analysis.

### Fact Tables
- `fct_orders` → one row per order  
- `fct_order_items` → one row per item  
- `fct_payments` → one row per payment  

### Dimension Tables
- `dim_customers`
- `dim_products`
- `dim_dates`

### Key Design Decisions
- **Grain separation**: Orders, items, and payments are modeled separately to avoid duplication and maintain analytical flexibility  
- **No fact-to-fact joins**: Prevents incorrect aggregations  
- **dbt layering**:
  - `staging` → cleaned raw data
  - `marts` → business-ready models  

This structure enables answering questions at different levels (order-level, item-level, payment-level) without losing detail.

---

## Dashboard

The Power BI dashboard provides a high-level overview of business performance:

- GMV, order volume, average order value, average installments
- Revenue trend with month-over-month comparison
- Top product categories by revenue 
- Payment method mix

![Dashboard](dashboard/screenshots/dashboard.PNG)

---

## Skills Demonstrated

- Data modeling (Star Schema, Fact & Dimension design)  
- dbt (staging, marts, modular SQL development)  
- SQL (BigQuery)  
- Data transformation & cleaning  
- BI development (Power BI)  
- End-to-end analytics pipeline design  

