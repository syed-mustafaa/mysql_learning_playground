-- Lesson 4: Joins
-- Goal: Learn how to combine data from multiple tables using JOIN.

-- 1. INNER JOIN
-- Returns records that have matching values in both tables.
-- Here we want to see the Department Name for each Employee.
-- We join 'employees' table with 'departments' table on the common column 'dept_id'.
SELECT 
    e.first_name, 
    e.last_name, 
    d.dept_name,
    d.location
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- 2. LEFT JOIN
-- Returns all records from the left table (employees), and the matched records from the right table (departments).
-- If there is no match, the result is NULL on the right side.
-- (Useful if an employee hasn't been assigned a department yet, though our data is clean).
SELECT 
    e.first_name, 
    d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- 3. Analyzing salaries by Department Name
-- Combining Helper Aggregations with Joins.
SELECT 
    d.dept_name,
    COUNT(e.emp_id) as num_employees,
    AVG(e.salary) as avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
