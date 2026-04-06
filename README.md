
# 🚀 Technical Home Challenge - Astrafy
**Candidate:** Javier Santuy Muñoz  
**Data Stack:** dbt Cloud + BigQuery + Looker Studio  
**Date:** 06/04/2026

---

## PART 1: Coding Challenge

Objective: Solve 6 SQL code exercises using Bigquery and dbt

--- 

### Data Architecture
The project follows a modular structure within **dbt**, moving from raw data to business-ready tables:
- **Models**
    - **Source:** The sources.yml file defines the connection to the raw data hosted in BigQuery.
    - **Staging:** Cleaned views with standardized column names and types.
    - **Marts:** Final tables and views created to solve each exercise.
- **Macros** When the workflow executes this file makes sure to have clean dataset names
- **dbt_project.yml** Defines settings for the project (directory paths for models and macros and materialization strategy)

---

### 📖 Tutorial 
1. Create a connection between bigquery and dbt
2. Create a dataset in BigQuery with the source tables. By default, the project looks for a dataset named `sources` and table named `order_recrutement` and `sales_recrutement`. If you use a different names, update the variable in `models/sources/sources.yml`
3. Once the sources are connected, verify that the code compiles using the `dbt compile` command. If the process completes successfully, execute `dbt run` to initiate the workflow.
4. Onces the workflow is executed, two datasets will be created:
    - Staging: Contains one view per source table to standardize column names and data types. This acts as an abstraction layer; if a source variable name changes, we only update this view, preventing any breaking changes in the final tables.
    - Marts: Contains the final models (views and tables) engineered to fulfill the requirements of each exercise.

---

### **Exercise 1** 
Number of orders in the year 2023  
[ 01_code ](models/marts/exercise_1.sql)

| | |
| :--- | :--- |
| **Total Orders (2023)** | **2,573** |

---

### **Exercise 2** 
Number of orders per month in the year 2023  
[ 02_code ](models/marts/exercise_2.sql)

| Month | Date | Order Count |
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
### **Exercise 3** 
Average number of products per order for each month of the year 2023  
[ 03_code ](models/marts/exercise_3.sql)

| Month | avg_products_order |
| :--- | :--- |
| 1 | 12.17 |
| 2 | 12.62 | 
| 3 | 13.07 | 
| 4 | 15.1 | 
| 5 | 14.63 | 
| 6 | 14.18 | 
| 7 | 13.75 | 
| 8 | 14.46 |
| 9 | 13.67 |
| 10 | 13.03 |
| 11 | 10.48 | 
| 12 | 11.33 |
---

### **Exercise 4** 

Generate a consolidated table for all orders from 2022 and 2023, add the qty_product column that gives the quantity of products in the order  
[ 04_code ](models/marts/exercise_4.sql)

---

### **Exercise 5**

Define customer segments based on purchasing behavior within a rolling 12-month window prior to each order.
    - New: it's the 1st order of the customer (client_id) in the past 12 months. In the 12 months prior to this order, the customer did not place any orders.
    - Returning: it's between the 2nd and the 4th order of the customer in the past 12 months. In the 12 months prior to this order, the customer had already placed between 1 and 3 orders.
    - VIP: it's the 5th or more order of the customer in the past 12 months. In the 12 months prior to this order, the customer had already placed at least 4 orders or more.  
[ 05_code ](models/marts/exercise_5.sql)

---

### **Exercise 6** 

Create a table (1 line per order) for all orders of the year 2023 only; with an additional column: the order_segmentation column which gives the segment of this order  
[ 06_code ](models/marts/exercise_6.sql)

---

## 🛠️ PART 2: LookML - Semantic Layer
LookML: [Model](02_LookML_Challenge/model) [view](02_LookML_Challenge/view)  
Dashboard: [Link](https://lookerstudio.google.com/u/0/reporting/e7516093-c37e-43ce-85db-fb09624f1b44/page/644tF/edit)  
Dashboard: [Source](models/marts/exercise_6.sql)

---

## 🎨 PART 3: Design Challenge
[View Marketing KPIs Guide](03_Design_Challenge/marketing_kpis.pdf)
