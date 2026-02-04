-- Lesson 2: Filtering Data
-- Goal: Learn how to filter rows using the WHERE clause.

-- 1. Basic filtering with WHERE
-- Get employees with a salary greater than 70,000.
SELECT * FROM employees WHERE salary > 70000;

-- 2. Filtering with text
-- Get employees who work in Department 2.
SELECT first_name, last_name FROM employees WHERE dept_id = 2;

-- 3. Using AND logic
-- Both conditions must be true.
-- Employees in Dept 2 AND earning more than 80,000.
SELECT * FROM employees 
WHERE dept_id = 2 AND salary > 80000;

-- 4. Using OR logic
-- At least one condition must be true.
-- Employees in Dept 1 OR Dept 3.
SELECT * FROM employees 
WHERE dept_id = 1 OR dept_id = 3;

-- 5. Using IN operator
-- A cleaner way to specify multiple possible values.
-- Equivalent to multiple ORs.
SELECT * FROM employees 
WHERE dept_id IN (1, 3, 5);

-- 6. Using BETWEEN operator
-- Selects values within a given range (inclusive).
SELECT * FROM employees 
WHERE salary BETWEEN 60000 AND 80000;
