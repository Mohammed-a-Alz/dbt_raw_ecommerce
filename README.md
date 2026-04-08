# BNPL Analytics Pipeline 

## Overview
This project simulates an end-to-end analytics pipeline for a Buy Now, Pay Later (BNPL) business model.  

It transforms raw e-commerce data into a structured data warehouse using dbt and BigQuery, and delivers business-ready insights through a Power BI dashboard.

The focus of this project is not just analysis, but building a scalable analytics layer that supports decision-making.

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

- Total GMV  
- Order volume  
- Payment behavior  
- Time-based trends  

## Dashboard Preview

![Dashboard](dashboard/screenshots/dashboard.PNG)

---

## Example Insights

> (To be expanded with deeper analysis)

- Orders with multiple installments tend to contribute a significant portion of total GMV  
- Sales show clear monthly variation, indicating seasonality in customer purchasing behavior  

---

## Skills Demonstrated

- Data modeling (Star Schema, Fact & Dimension design)  
- dbt (staging, marts, modular SQL development)  
- SQL (BigQuery)  
- Data transformation & cleaning  
- BI development (Power BI)  
- End-to-end analytics pipeline design  

---

## Project Structure
dbt_bnpl_analytics/
├── models/
│ ├── staging/
│ └── marts/
├── analyses/
├── tests/
├── dashboard/
│ ├── tamara_dashboard.pbix
│ └── screenshots/
├── dbt_project.yml
└── README.md
