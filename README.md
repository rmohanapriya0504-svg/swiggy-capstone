Swiggy Cuisine Performance Diagnostic

Project Overview

-- This project analyzes Swiggy cuisine revenue performance using SQLite,
Excel, and Tableau Public. The same dataset is used across SQL,
spreadsheet analysis, and Tableau to compare cuisine revenue against
monthly targets.

Project Files
--## Project Files

- [generate_data.py]-- generate_data.py - Python script used to generate the SQLite database.
- [swiggy_capstone.db]-- swiggy_capstone.db - SQLite database.
- [verify.sql]-- verify.sql - Database verification queries.
- [01_foundations.sql]-- 01_foundations.sql - Foundation SQL queries.
- [02_aggregation_joins.sql]-- 02_aggregation_joins.sql - Aggregation and join queries.
- [03_reporting.sql]-- 03_reporting.sql - Reporting queries.
- [monthly_cuisine_revenue.csv]-- monthly_cuisine_revenue.csv - Monthly cuisine revenue exported from SQL.
- [swiggy_capstone_analysis.xlsx]-- swiggy_capstone_analysis.xlsx - Spreadsheet analysis and reconciliation.
- [DATA_STORY.md]--DATA_STORY.md - Data story and recommendations.
- [ai_log.md] -- ai_log.md - AI-assisted prompts and verification steps.

How to Regenerate the Database
Run:
python generate_data.py
This creates swiggy_capstone.db.

SQL Queries
-The SQL tasks are available in:
--01_foundations.sql
--02_aggregation_joins.sql
--03_reporting.sql
--verify.sql

Tableau Public Dashboard

Swiggy Revenue Dashboard 
--- (https://public.tableau.com/views/SwiggyRevenueDashboard/SwiggyRevenueDashboard)

Data Story
See DATA_STORY.md.

AI Log
See ai_log.md.