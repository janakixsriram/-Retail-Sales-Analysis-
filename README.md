# 🛒 Retail Sales Analysis Dashboard using SQL and Power BI

This project presents a comprehensive retail sales analysis using a dataset from Kaggle, combining **PostgreSQL**, **MS Excel**, and **Power BI**. The goal was to uncover sales performance insights across stores and departments, understand holiday impacts, and identify sales trends over time. It’s designed for data-driven decision-making in a retail business context.

---

## 📌 Tools Used

- **Power BI** – for dashboard design, data modeling, and visualizations  
- **PostgreSQL** – for data cleaning and SQL querying  
- **Microsoft Excel** – for initial data wrangling and schema structuring  

---

## 📁 Dataset Overview

- **Source:** [Kaggle – Retail Dataset](https://www.kaggle.com/datasets/manjeetsingh/retaildataset)  
- **Contents:** Weekly sales data for multiple stores and departments  
- **Columns include:** Store ID, Department ID, Weekly Sales, Date, Holiday Flag, Store Size, Store Type  
- **Timeframe:** 2010–2012 (143 weeks)  

---

## 🎯 Project Objective

The objective of this project is to analyze weekly retail sales data to uncover meaningful trends and insights. This includes:
- Understanding how sales differ across stores, departments, and time periods  
- Evaluating the impact of holidays on sales performance  
- Identifying high-performing store types and sizes  
- Providing data-driven recommendations for retail decision-making  

---

## 📊 Dashboard Pages Overview

### 1. **Overview & Quality Check**
A summary of key metrics and data integrity checks. This page highlights:
- Total sales over time  
- Number of records  
- Null value checks  
- Breakdown of holiday vs non-holiday sales  

### 2. **Store and Department Performance Overview**
Evaluates which stores and departments generate the most sales:
- Top 10 and bottom 10 performing stores  
- Department-wise performance rankings  
- Sales contributions per department  

### 3. **Weekly and Monthly Sales Trends**
Visualizes sales trends over time:
- Yearly comparisons of weekly sales  
- Monthly average sales patterns  
- Identifies seasonal peaks and dips  

### 4. **Impact of Holiday in Sales Performance**
Assesses how holidays affect sales:
- Comparison between holiday and non-holiday weeks  
- Sales trends during major US holidays  
- Impact of specific holidays (e.g., Super Bowl, Thanksgiving, Christmas)  

### 5. **Performance by Store Type and Size**
Breaks down sales performance by:
- Store type (A, B, C)  
- Store size (sq. ft.)  
- Correlation between store size and revenue  

### Executive Summary
A final page summarizing the key findings, KPIs, and strategic insights gathered throughout the analysis.

---

## 🔍 Key Insights

- 🧨 **Holiday sales only contribute 7.5%** to overall revenue, despite common assumptions  
- 🏆 **Store 20** outperforms all others in both cumulative and average weekly sales  
- 🧱 **Department 92** consistently has the highest sales volume, while some departments show negligible or flat performance  
- 🔄 **Sales follow a strong seasonal pattern**, peaking during the end-of-year months and mid-summer  
- 🏬 **Store Type A and larger stores (≥200,000 sq. ft.)** generate significantly higher revenue  

---

## 🧠 Challenges & Learnings

As my **first end-to-end BI project**, I learned to:
- Set up and connect data sources efficiently  
- Write optimized SQL queries for BI integration  
- Overcome Power BI quirks (like sorting filters not behaving as expected)  
- Design clean, insight-driven visuals  

I had occasional hurdles — but with the help of **ChatGPT**, I was able to debug and advance through blockers efficiently.

---

## 📥 Files & Artifacts

- Power BI Dashboard (`.pbix`)  
- SQL Queries & Data Schema  
- Optional: CSV exports, Excel preprocessing workbook  
