# Employee Management & HR Analytics SQL Project

## Overview
A MySQL/MariaDB project demonstrating relational database design, employee records, department management, project assignments, and salary history.

## Technologies
- MariaDB / MySQL
- SQL
- Amazon Linux 2023
- Linux terminal

## Database Tables
1. **departments** — department details
2. **employees** — employee information, salaries, and hire dates
3. **projects** — project names and budgets
4. **employee_projects** — employee-to-project assignments
5. **salary_history** — historical salary records

## SQL Concepts Demonstrated
- Database and table creation
- Primary keys and foreign keys
- Constraints and data types
- INSERT and SELECT
- WHERE, DISTINCT, ORDER BY, and LIKE
- Aggregate functions: COUNT, AVG
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- Subqueries
- BETWEEN and date filtering
- Calculated columns
- CASE expressions
- Common Table Expressions (CTEs)
- Window functions: RANK and DENSE_RANK
- Running totals using window functions
- Department-wise salary analysis
- Employees earning above department averages

## Project Setup
Run these commands from the project directory on a machine with MariaDB installed:

```bash
mariadb < schema.sql
mariadb < data.sql
```

Run the queries from the Linux terminal with:

```bash
mariadb < queries.sql
```

**Note:** Run the schema and data setup commands only once on a fresh project database. The setup files are not designed to be rerun against populated tables.

## Project Structure

```text
employee-management-sql/
├── schema.sql
├── data.sql
├── queries.sql
└── README.md
```

## Purpose
Created as a hands-on SQL learning project to demonstrate relational database fundamentals and practical query writing for entry-level IT roles.
