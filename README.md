
# 🚀 Technical Home Challenge - Astrafy
**Candidate:** Javier Santuy Muñoz  
**Data Stack:** dbt Cloud + BigQuery + Looker Studio  
**Date:** 06/04/2026

---

## 🏗️ Data Architecture
The project follows a modular structure within **dbt**, moving from raw data to business-ready tables:
- **Source:** Raw data connected to BigQuery.
- **Staging:** Cleaned views with standardized column names and types.
- **Marts:** Final tables and views created to solve each exercise.

---
# Project Documentation: Data Analysis & Design Challenge

---

## 🔍 PART 1: Coding Challenge

---

### **Exercise 1: Total Order Volume (2023)**

**Objective:** Determine the total number of orders processed during the 2023 fiscal year.

| Metric | Resulting Value |
| :--- | :--- |
| **Total Orders (2023)** | **2,573** |

---

### **Exercise 2: Monthly Order Distribution (2023)**

**Objective:** Analyze monthly order volumes for the year 2023 to identify seasonal trends and performance fluctuations.

| Month | Reference Date | Order Count |
| :--- | :--- | :--- |
| 1 | 2023-01-01 | 232 |
| 2 | 2023-02-01 | 176 |
| 3 | 2023-03-01 | 203 |
| 4 | 2023-04-01 | 188 |
| 5 | 2023-05-01 | 172 |
| 6 | 2023-06-01 | 169 |
| 7 | 2023-07-01 | 193 |
| 8 | 2023-08-01 | 167 |
| 9 | 2023-09-01 | 212 |
| 10 | 2023-10-01 | 223 |
| 11 | 2023-11-01 | 389 |
| 12 | 2023-12-01 | 249 |

---

### **Exercise 4: Data Enrichment – Product Quantity (2022-2023)**

**Objective:** Generate a consolidated table for all orders from 2022 and 2023, including a specific metric for the number of products per transaction.

| Required Field | Description |
| :--- | :--- |
| `order_id` | Unique transaction identifier. |
| `order_date` | Date of the purchase. |
| `qty_product` | Total quantity of products in the order. |

---

### **Exercise 5: Customer Segmentation Logic**

**Objective:** Define customer segments based on purchasing behavior within a rolling 12-month window prior to each order.

| Segment | Definition | Criteria (Prior 12 Months) |
| :--- | :--- | :--- |
| **New** | First order in the period. | 0 previous orders. |
| **Returning** | Frequent customer activity. | Between 1 and 3 previous orders. |
| **VIP** | High-value customer loyalty. | 4 or more previous orders. |

---

### **Exercise 6: 2023 Segmentation Implementation**

**Objective:** Apply the segmentation framework to all individual orders placed during the 2023 calendar year.

| Field Name | Data Type | Description |
| :--- | :--- | :--- |
| `order_id` | ID | Unique identifier for the order. |
| `client_id` | ID | Unique identifier for the customer. |
| `order_segmentation` | String | Assigned category (New, Returning, or VIP). |

---

## 🛠️ PART 2: LookML – Semantic Layer

---

## 🎨 PART 3: Design Challenge

---

### **(Bonus): Sales Performance Forecasting**

**Objective:** Provide predictive insights for upcoming periods to assist in strategic resource allocation and inventory management.

* **Weekly Projections:** Expected sales trends for the next 7-day cycle.
* **Monthly Forecast:** Long-term performance anticipation based on historical seasonality.

---
