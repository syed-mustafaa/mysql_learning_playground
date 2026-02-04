-- Lesson 1: Basic Data Retrieval
-- Goal: Learn how to fetch data from tables using SELECT.

-- 1. Select all columns from a table
-- The asterisk (*) means "all columns".
SELECT * FROM employees;

-- 2. Select specific columns
-- It's better practice to list only the columns you need.
SELECT first_name, last_name, email FROM employees;

-- 3. Select distinct values
-- Using DISTINCT removes duplicate values from the result.
-- Here we see all the unique department IDs referenced in the employees table.
SELECT DISTINCT dept_id FROM employees;

-- 4. Sorting results
-- ORDER BY is used to sort the result set. 
-- By default it sorts in Ascending (ASC) order. Use DESC for Descending.
SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary DESC;

-- 5. Limit results
-- Useful for large tables, LIMIT restricts the number of rows returned.
-- (Note: In standard MySQL this is LIMIT, in SQL Server it's TOP)
SELECT * FROM employees LIMIT 3;
