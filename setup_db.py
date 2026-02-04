import sqlite3
import os

DB_NAME = "company.db"

def create_database():
    if os.path.exists(DB_NAME):
        os.remove(DB_NAME)
    
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    
    print("Creating tables...")
    
    # 1. Departments Table
    cursor.execute("""
    CREATE TABLE departments (
        dept_id INTEGER PRIMARY KEY,
        dept_name TEXT NOT NULL,
        location TEXT
    );
    """)
    
    # 2. Employees Table
    cursor.execute("""
    CREATE TABLE employees (
        emp_id INTEGER PRIMARY KEY,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        email TEXT UNIQUE,
        salary REAL,
        hire_date DATE,
        dept_id INTEGER,
        FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
    );
    """)
    
    print("Inserting data...")
    
    # Insert Departments
    departments = [
        (1, 'HR', 'New York'),
        (2, 'Engineering', 'San Francisco'),
        (3, 'Sales', 'Chicago'),
        (4, 'Marketing', 'New York'),
        (5, 'IT Support', 'Austin')
    ]
    cursor.executemany("INSERT INTO departments VALUES (?, ?, ?)", departments)
    
    # Insert Employees
    employees = [
        (101, 'John', 'Doe', 'john.doe@company.com', 75000, '2021-01-15', 2),
        (102, 'Jane', 'Smith', 'jane.smith@company.com', 82000, '2020-05-23', 2),
        (103, 'Mike', 'Wilson', 'mike.wilson@company.com', 60000, '2022-03-10', 3),
        (104, 'Emily', 'Davis', 'emily.davis@company.com', 62000, '2021-11-05', 1),
        (105, 'Chris', 'Brown', 'chris.brown@company.com', 55000, '2023-01-20', 5),
        (106, 'Sarah', 'Miller', 'sarah.miller@company.com', 95000, '2019-07-12', 2),
        (107, 'David', 'Taylor', 'david.taylor@company.com', 58000, '2022-08-30', 3),
        (108, 'Emma', 'Anderson', 'emma.anderson@company.com', 71000, '2020-12-01', 4),
        (109, 'Robert', 'Thomas', 'robert.thomas@company.com', 48000, '2023-06-15', 5),
        (110, 'Olivia', 'Martinez', 'olivia.martinez@company.com', 76000, '2021-04-18', 4)
    ]
    cursor.executemany("INSERT INTO employees VALUES (?, ?, ?, ?, ?, ?, ?)", employees)
    
    conn.commit()
    conn.close()
    print(f"Database {DB_NAME} created and populated successfully!")

if __name__ == "__main__":
    create_database()
