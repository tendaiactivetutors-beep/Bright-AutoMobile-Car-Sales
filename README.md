# Bright-AutoMobile-Car-Sales
#🚗 Bright Motors Car Sales Analysis
#📌 Overview

##This project analyzes vehicle sales data for Bright-AutoMobile-Car-Sales to uncover insights that drive revenue growth, optimize inventory, and improve regional performance.

> **Case Study:** Business Insights for a New Head of Sales
> **Role:** Junior Data Analyst
> **Provider:** BrightLearn Data Analytics
> **Dataset:** *Bright-AutoMobile-Car-Sales* (daily transactional & pricing data)

---

## 1. 🧩 Problem Statement

Bright Motors has recently appointed a new **Head of Sales** tasked with **expanding the dealership network, improving sales performance, and optimising inventory**. However, leadership currently lacks a clear, data-driven view of:

- Which **car makes and models** are actually driving revenue and profit?.
- How **price, mileage, and year of manufacture** influence what customers buy?.
- Which **regions** are over- or under-performing?.
- What **emerging customer preferences** (e.g. fuel type, vehicle age) should shape future stock and marketing decisions?.

Without these insights, the dealership risks misallocating inventory, running ineffective marketing campaigns, and missing growth opportunities in high-potential regions.

---

## 2. 🎯 Aim of the Project

To analyse the historical *Bright-AutoMobile-Car-Sales* dataset and deliver **actionable business insights and recommendations** that help the new Head of Sales make informed decisions on **inventory, pricing, regional expansion, and marketing strategy**.

---

## 3. 🛠️ Objectives — Steps Taken to Solve for the Aim

The project followed a structured analytics workflow:

### Step 1 — Planning & Architecture
- Designed a data-flow / architecture diagram in **Miro** and **Gantt Chart**showing:
  `Source (CSV/Excel) → ETL (cleaning) → Storage (Databricks) → Analysis (SQL + Databricks/Power BI/Google Locker Studio) → Presentation (PowerPoint)`.
- Defined the key insights to deliver and the metrics required.

### Step 2 — Data Processing (SQL / Databricks)
- Converted the provided Excel file into CSV and loaded it into Databricks.
- Cleaned the data: removed duplicates, handled missing values, stripped currency symbols, and converted text-based prices (e.g. `'15,000'`) to numeric format.
- Created derived columns:
  - `total_revenue = selling_price * units_sold`
  - `profit_margin = (selling_price − cost_price) / selling_price * 100`
- Categorised vehicles into **High / Medium / Low Margin** performance tiers.
- Grouped transactions by **month, quarter, and year** for trend analysis.

### Step 3 — Analysis & Visualisation
- Connected the processed data to **Power BI/ BigQuery / Excel / Looker Studio**.
- Built an interactive dashboard with **slicers for region, fuel type, and year**.
- 
 **Analysed:**
  - Revenue by make and model
  - Sales distribution by year and fuel type
  - Regional performance (city / province)
  - Average selling price trends over time
  - Relationship between price, mileage, and year of manufacture

### Step 4 — Presentation & Recommendations
- Summarised the findings into a clear, visually appealing presentation for the Head of Sales, with concise insight notes and prioritised recommendations.

---

## 4. 📈 Summary of Results

> *Placeholders — replace with the actual figures from your analysis.*

- 🥇 **Top revenue-generating make:** _e.g. Toyota_, contributing **~XX%** of total revenue.
- 🚙 **Best-selling model:** _e.g. Toyota Corolla_, with **XX,XXX units** sold.
- ⛽ **Leading fuel type:** _e.g. Petrol vehicles_ accounted for **~XX%** of sales; hybrid sales are growing year-on-year.
- 📍 **Top region:** _e.g. Gauteng_ generated the highest sales volume and revenue, followed by _Western Cape_.
- 📉 **Price vs. mileage:** Strong **negative correlation** — selling price drops sharply once mileage exceeds **~100,000 km**.
- 📅 **Year of manufacture:** Vehicles **3–5 years old** showed the best balance of demand and margin.
- 💰 **Profit margin tiers:** **XX%** of vehicles classified as *High Margin*, **XX%** *Medium*, **XX%** *Low*.

### Key Recommendations
1. **Stock more high-margin, mid-age vehicles** (3–5 years old, < 100,000 km).
2. **Prioritise expansion** in top-performing regions and investigate under-performers.
3. **Invest in marketing for emerging fuel types** (hybrid / electric) as adoption rises.
4. **Phase out consistently low-margin models** to free up showroom and capital.

---

## 5. 🧰 Tools Used in the Case Study

| Layer | Tool(s) Used |
|---|---|
| **Coding / SQL** | Databricks *(also valid:BigQuery, Snowflakes, MS SQL Server, MySQL Workbench)* |
| **Visualisation** | Looker Studio *(also valid: Excel, Google Sheets, Power BI)* |
| **Presentation** | PowerPoint *(also valid: Canva)* |
| **Project Planning** | Miro *(also valid: Gantt Chart)* |


##📂 Project Structure

.. ├── data/

.. │   ├── raw_data.csv

.. │   ├── processed_data.xlsx

.. ├── sql/

.. │   ├── car_sales_queries.sql

.. ├── dashboard/

.. │   ├── dashboard.locker studio /dashboard.pbix / excel_dashboard.xlsx

.. ├── presentation/

.. │   ├── Bright-AutoMobile-Car-Sales.pdf


##🔄 Data Processing

. Converted price fields to numeric
. Removed inconsistencies and null values
. Created calculated metrics:
.Total Revenue
. Profit Margin
. Margin Categories

##📊 Key Insights

##🚘 Revenue Drivers
. A small group of car models contributes the majority of revenue

##🌍 Regional Performance
. Certain regions dominate sales, indicating expansion opportunities

##⛽ Customer Preferences
. Fuel type trends show shifting demand patterns

###💰 Profitability

. High-margin vehicles are not always top-selling but drive profitability

###📈 Dashboard Features

. Revenue by Make & Model
. Sales by Region
. Revenue Trends Over Time
. Fuel Type Distribution
. Price vs Mileage Analysis
. Interactive filters (Year, Region, Fuel Type)

###💡 Recommendations

. Increase stock for high-demand models
. Expand operations in high-performing regions
. Promote high-margin vehicles
. Align pricing strategies with mileage and year trends

##🚀 Outcome

.This analysis provides data-driven insights to support strategic decisions for increasing revenue and operational efficiency at Bright-AutoMobile-Car-Sales.

## 👤 Author: Tendai Shumba
tendai.activetutors@gmail.com  ·   https://github.com/tendaiactivetutors-beep

**Junior Data Analyst** — Bright-AutoMobile-Car-Sales Case Study
Course provider: [BrightLearn](https://brightlearn.co.za) · 📧 rofhiwa@brightlighttutorials.co.za

*Completed as part of the BrightLearn Data Analytics case study programme.*

