USE employee_management_project;

-- 1. Display all employees
SELECT * FROM employees;

-- 2. Select specific columns
SELECT employee_name, salary FROM employees;

-- 3. Filter employees by salary
SELECT * FROM employees
WHERE salary >= 70000;

-- 4. Sort employees by salary
SELECT * FROM employees
ORDER BY salary DESC;

-- 5. Find unique salaries
SELECT DISTINCT salary FROM employees;

-- 6. Count employees
SELECT COUNT(*) AS total_employees FROM employees;

-- 7. Calculate average salary
SELECT AVG(salary) AS average_salary FROM employees;

-- 8. Department-wise employee count
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- 9. Departments and their employees
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- 10. Include departments even when they have no employees
SELECT d.department_name, e.employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- 11. Employees earning above the average salary
SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 12. Find employees whose names start with A
SELECT * FROM employees
WHERE employee_name LIKE 'A%';

-- 13. Find employees hired after January 1, 2023
SELECT employee_name, hire_date
FROM employees
WHERE hire_date > '2023-01-01';

-- 14. Department-wise average salary
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 15. Employee-project assignments
SELECT e.employee_name, p.project_name, ep.project_role
FROM employee_projects ep
INNER JOIN employees e ON ep.employee_id = e.employee_id
INNER JOIN projects p ON ep.project_id = p.project_id;

-- 16. Salary history
SELECT e.employee_name, sh.salary, sh.effective_date
FROM salary_history sh
INNER JOIN employees e ON sh.employee_id = e.employee_id
ORDER BY e.employee_name, sh.effective_date;

-- 17. Employees earning between 50000 and 90000
SELECT employee_name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 90000;

-- 18. Departments with more than one employee
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 1;

-- 19. Increase salaries by 5% (preview only; no data changes)
SELECT employee_name, salary,
       salary * 1.05 AS proposed_salary
FROM employees;

-- 20. Employees without a department
SELECT e.employee_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
