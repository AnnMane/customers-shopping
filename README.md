![Python](https://img.shields.io/badge/python-3776AB.svg?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/sql-025E8C.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Excel](https://img.shields.io/badge/excel-217346.svg?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![GitHub](https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logo=github&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/postgresql-336791.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![VS Code](https://img.shields.io/badge/vscode-007ACC.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Terminal](https://img.shields.io/badge/terminal-222222.svg?style=for-the-badge&logo=windows-terminal&logoColor=white)

# 🛍️ Customer Shopping Data Analysis & Automation

## 📊 Project Overview
This project represents an **end-to-end data analysis pipeline** for retail sales data. Unlike standard analysis performed on static CSV files, this project mimics a real-world enterprise environment where data is managed in a **relational database (PostgreSQL)** and reporting is **fully automated using Python**.

The goal was to analyze customer demographics, shopping behaviors, and sales trends, while establishing a reproducible workflow that automatically extracts data and generates **Excel reports**.

## 🛠️ Tech Stack
* **PostgreSQL (pgAdmin4):** Database management and centralized data storage.
* **SQL:** Advanced querying for data cleaning, segmentation, and aggregation.
* **Python (Pandas, Psycopg2):** ETL automation and database connection scripting.
* **Excel:** The final output format for business reporting.
* **VS Code:** Integrated Development Environment (IDE).

## ⚙️ Work Process 

### 1. Database Architecture & Data Ingestion
* Moved away from flat files by designing a **PostgreSQL database schema**.
* Imported raw customer data into the database to enable structured querying and data persistence.

### 2. Modular SQL Analysis
I structured the SQL queries into **numbered, modular files** to ensure maintainability and logical flow. Instead of one giant script, the analysis is broken down:
* **Data Quality:** `1.0_missing_values.sql`, `1.1_duplicate_records.sql` - Cleaning data at the source.
* **Demographics:** `1.3_Gender.sql`, `3.1_age_sex_and_location...` - Understanding the customer base.
* **Sales Trends:** `2.3_monthly_sales_trends.sql` - Identifying seasonal peaks.
* **KPIs:** `2.1_Top_shopping_mall...` - Ranking top-performing locations.

### 3. Python Automation (ETL Script)
This is the core technical highlight of the project. I developed a Python script (`excels.py`) to automate the reporting process:
* **Database Connection:** Uses `psycopg2` to securely connect to the PostgreSQL instance.
* **Query Execution:** Iterates through the folder of SQL files and executes them sequentially.
* **Automated Export:** Fetches the results of each query and automatically saves them as separate **Excel reports**, ready for stakeholders.

## 📈 Key Insights
* **Customer Demographics:** Analyzed the distribution of customers by age and gender to tailor marketing strategies.
* **Mall Performance:** Identified top-performing shopping malls based on total revenue and transaction volume.
* **Seasonal Trends:** Calculated monthly sales fluctuations to predict high-demand periods.
* **Category Analysis:** Determined which product categories drive the most revenue
