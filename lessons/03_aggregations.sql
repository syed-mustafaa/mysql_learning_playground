-- Lesson 3: Aggregations and Grouping
-- Goal: Learn how to summarize data using aggregate functions.

-- 1. COUNT
-- Count total number of rows (employees).
SELECT COUNT(*) as total_employees FROM employees;

-- 2. SUM and AVG
-- Calculate total salary expense and average salary.
SELECT 
    SUM(salary) as total_salary_expense,
    AVG(salary) as average_salary
FROM employees;

-- 3. GROUP BY
-- Group rows that have the same values into summary rows.
-- Here we calculate the number of employees per department.
SELECT dept_id, COUNT(*) as employee_count
FROM employees
GROUP BY dept_id;

-- 4. GROUP BY with multiple metrics
-- Average salary per department.
SELECT 
    dept_id, 
    COUNT(*) as emp_count, 
    AVG(salary) as avg_dept_salary
FROM employees
GROUP BY dept_id;

-- 5. HAVING clause
-- The HAVING clause was added to SQL because the WHERE keyword 
-- could not be used with aggregate functions.
-- Here we show only departments with an average salary greater than 70,000.
SELECT 
    dept_id, 
    AVG(salary) as avg_dept_salary
FROM employees
GROUP BY dept_id
HAVING avg_dept_salary > 70000;
