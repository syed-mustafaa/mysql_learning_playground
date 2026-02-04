-- Lesson 5: Advanced Window Functions
-- Goal: Learn advanced analytical functions (Modern SQL).

-- 1. RANK()
-- Rank employees by salary within the entire company.
SELECT 
    first_name, 
    last_name, 
    salary,
    RANK() OVER (ORDER BY salary DESC) as salary_rank
FROM employees;

-- 2. PARTITION BY
-- Rank employees by salary WITHIN their specific department.
-- This resets the ranking for each department.
SELECT 
    first_name, 
    last_name, 
    dept_id,
    salary,
    RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) as dept_salary_rank
FROM employees;

-- 3. Running Total (Cumulative Sum)
-- Calculate a running total of salary expenses order by hire date.
SELECT 
    hire_date,
    salary,
    SUM(salary) OVER (ORDER BY hire_date) as cumulative_salary_expense
FROM employees;
