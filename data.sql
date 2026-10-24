USE employee_management_project;

INSERT INTO departments (department_name)
VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

INSERT INTO employees
(employee_name, email, salary, age, department_id, hire_date)
VALUES
('Rahul', 'rahul@example.com', 90000, 25, 1, '2023-01-15'),
('Priya', 'priya@example.com', 60000, 27, 2, '2022-06-10'),
('Amit', 'amit@example.com', 70000, 24, 1, '2024-02-20'),
('Sneha', 'sneha@example.com', 80000, 29, 3, '2021-09-05'),
('Kiran', 'kiran@example.com', 40000, 23, 2, '2024-07-12'),
('Neha', 'neha@example.com', 75000, 28, 4, '2022-11-01'),
('Arjun', 'arjun@example.com', 95000, 32, 1, '2020-03-18'),
('Divya', 'divya@example.com', 55000, 26, 3, '2023-08-22');

INSERT INTO projects (project_name, budget)
VALUES
('Website Redesign', 250000),
('Cloud Migration', 500000),
('Payroll Automation', 150000),
('Marketing Analytics', 200000);

INSERT INTO employee_projects
(employee_id, project_id, assigned_date, project_role)
VALUES
(1, 1, '2024-01-10', 'Developer'),
(1, 2, '2024-03-15', 'Cloud Engineer'),
(2, 3, '2024-02-01', 'HR Analyst'),
(3, 1, '2024-01-10', 'Developer'),
(4, 3, '2024-04-12', 'Finance Analyst'),
(5, 3, '2024-05-01', 'HR Assistant'),
(6, 4, '2024-06-15', 'Marketing Analyst'),
(7, 2, '2024-03-15', 'Cloud Architect'),
(8, 4, '2024-06-15', 'Data Analyst');

INSERT INTO salary_history
(employee_id, salary, effective_date)
VALUES
(1, 80000, '2022-01-15'),
(1, 90000, '2023-07-01'),
(2, 50000, '2021-06-10'),
(2, 60000, '2023-06-10'),
(3, 65000, '2023-02-20'),
(3, 70000, '2024-02-20'),
(4, 70000, '2020-09-05'),
(4, 80000, '2022-09-05');
