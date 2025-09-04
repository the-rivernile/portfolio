# SQL + Power BI Dashboard Project

## 📌 Project Overview
This project demonstrates how I used **SQL** to extract and transform data, then built a **Power BI dashboard** to visualize key business insights.  
It showcases the end-to-end workflow of a data analyst:
1. Writing SQL queries to answer business questions.
2. Exporting cleaned datasets.
3. Building KPI cards and visualizations in Power BI.

---

## 🛠 Tools & Skills
- **SQL** (joins, aggregations, filtering, window functions)
- **Power BI** (KPI cards, bar charts, trend lines, slicers)
- **Data Preparation** (cleaning, aggregating, exporting)
- **Business Reporting**

---

## 📊 Dashboard Features
- **3 KPI Cards**  
  - Average User rating 
  - Number of users who left reviews 
  - Apps reviewed

- **4 Visualizations**  
  - Average of User Ratings Based on Verification
  - Average Helpful Revies By App
  - Top 5 Most Helpful Reviews  
  - User distribution by Continent/Country

---

## 🗂 Repository Structure
- `sql/` → SQL queries used for extraction and KPIs  
- `visuals/` → Power BI dashboard screenshots  
- `README.md` → Project documentation  

---

## 🔍 Example SQL Query
```sql
SELECT 
    DATE_TRUNC('year', review_date) AS review_year,
    ROUND(AVG(rating), 2) AS avg_rating
FROM reviews
GROUP BY DATE_TRUNC('year', review_date)
ORDER BY review_year;
