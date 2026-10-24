CREATE DATABASE IF NOT EXISTS employee_management_project;
USE employee_management_project;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) NOT NULL,
    age INT,
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2)
);

CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    assigned_date DATE,
    project_role VARCHAR(50),
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),
    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
);

CREATE TABLE salary_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
