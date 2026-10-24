USE employee_management_project;

-- 1. CASE: Categorize employees by salary
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High Salary'
        WHEN salary >= 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employees;

-- 2. CTE: Employees earning above the average salary
WITH salary_stats AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.employee_name, e.salary
FROM employees e
CROSS JOIN salary_stats s
WHERE e.salary > s.avg_salary;

-- 3. Window function: Rank employees by salary
SELECT
    employee_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 4. Window function: Rank salaries within each department
SELECT
    e.employee_name,
    d.department_name,
    e.salary,
    DENSE_RANK() OVER (
        PARTITION BY e.department_id
        ORDER BY e.salary DESC
    ) AS department_salary_rank
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

-- 5. Running salary total ordered by employee ID
SELECT
    employee_name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_salary_total
FROM employees;

-- 6. Employees earning above their department's average
WITH department_stats AS (
    SELECT
        department_id,
        AVG(salary) AS avg_department_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.employee_name,
    e.salary,
    d.department_name,
    ROUND(s.avg_department_salary, 2) AS department_average
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN department_stats s
    ON e.department_id = s.department_id
WHERE e.salary > s.avg_department_salary;

-- 7. Department salary summary
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    COALESCE(SUM(e.salary), 0) AS total_salary,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_salary DESC;
