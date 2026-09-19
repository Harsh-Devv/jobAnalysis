# SQL for Data Analytics Project: Job Market Analysis

## Overview

This project dives into the 2023 tech job market to identify the most in-demand skills, highest-paying roles, and optimal skills to learn for Data Analysts.

The project queries a real-world relational database containing thousands of job postings, company details, and required skills.

---

## Key Questions Explored

1. **Top-Paying Jobs:** What are the highest-paying Data Analyst roles available remotely?
2. **Top-Paying Job Skills:** What specific skills are required for these high-paying roles?
3. **Most In-Demand Skills:** Which skills appear most frequently across all Data Analyst job postings?
4. **Top Skills Based on Salary:** Which skills correlate with the highest average salaries?
5. **Most Optimal Skills:** What skills are both high in demand and command high average pay?

---

## Database & Tools Used

- **SQL Dialect:** PostgreSQL
- **Database Client:** pgAdmin 4 / VS Code (with SQLTools extension)
- **Key SQL Techniques:**
  - Aggregations (`COUNT`, `AVG`, `ROUND`)
  - Filtering & Ordering (`WHERE`, `HAVING`, `ORDER BY`, `LIMIT`)
  - Multi-table joins (`INNER JOIN`, `LEFT JOIN`)
  - Common Table Expressions (CTEs) & Subqueries
  - Date/Time functions (`EXTRACT`, `TO_CHAR`)
  - Set operators (`UNION`, `UNION ALL`)

---

## Project Structure & Analysis Queries

### 1. Top-Paying Data Analyst Jobs

Identifies the top 10 highest-paying Data Analyst roles that are offered remotely, ensuring valid salary figures.

- **File:** `1_top_paying_jobs.sql`
- **Key Finding:** Top roles focus on specialized titles like Principal Data Analyst or Director-level analytics roles, with annual salaries exceeding $200,000+.

### 2. Skills Required for Top-Paying Roles

Extracts the specific skills demanded by the top 10 highest-paying Data Analyst positions identified in query 1.

- **File:** `2_top_paying_job_skills.sql`
- **Key Finding:** High-paying roles heavily prioritize Python, SQL, Tableau, and cloud platforms like AWS and Snowflake.

### 3. Most In-Demand Skills

Calculates the top 5 skills most requested in Data Analyst job postings overall.

- **File:** `3_top_demanded_skills.sql`
- **Key Finding:** **SQL** and **Excel** lead total market demand, closely followed by **Python**, **Tableau**, and **Power BI**.

### 4. Top Skills by Average Salary

Analyzes which skills command the highest average compensation, filtering out outliers with low posting frequencies.

- **File:** `4_top_paying_skills.sql`
- **Key Finding:** Niche big data, machine learning, and cloud infrastructure tools (e.g., PySpark, Bitbucket, Couchbase, DataRobot) dominate the highest-paying skill sets.

### 5. Most Optimal Skills to Learn (High Demand + High Salary)

Combines demand and salary metrics to highlight high-value skills that offer both strong job security and strong compensation.

- **File:** `5_optimal_skills.sql`
- **Key Finding:** **Python**, **Snowflake**, and **Tableau** emerge as the most balanced, high-yield skills for career advancement in data analytics.

---

## Key Takeaways

- **Foundations First:** SQL and Excel remain non-negotiable baselines across the majority of data analytics job postings.
- **The High-Income Pathway:** Transitioning from baseline visualization (Tableau/Power BI) toward programming (Python) and modern data stack tools (Snowflake, BigQuery) provides the largest salary upside.
