# MySQL Learning Playground 🐬

A hands-on, self-contained project to learn and master MySQL using a demo Employee Database.

## 📂 Project Structure
- `setup_db.py`: Python script to create and populate the `company.db` database (using SQLite for portability, but learning standard SQL).
- `run_lesson.py`: A helper script to execute the SQL lesson files and see the output in your terminal.
- `lessons/`: Folder containing progressive SQL topics.

## 🚀 How to Start
1. **Initialize the Database**:
   ```bash
   python setup_db.py
   ```
   *This creates a `company.db` file with `employees` and `departments` tables.*

2. **Run a Lesson**:
   Execute the SQL files using the runner script:
   ```bash
   python run_lesson.py lessons/01_basic_retrieval.sql
   ```

## 📚 Curriculum
| Lesson | Topic | Concepts Covered |
| :--- | :--- | :--- |
| **01** | [Basic Retrieval](lessons/01_basic_retrieval.sql) | `SELECT`, `DISTINCT`, `ORDER BY`, `LIMIT` |
| **02** | [Filtering](lessons/02_filtering.sql) | `WHERE`, `AND`, `OR`, `IN`, `BETWEEN` |
| **03** | [Aggregations](lessons/03_aggregations.sql) | `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING` |
| **04** | [Joins](lessons/04_joins.sql) | `INNER JOIN`, `LEFT JOIN` |
| **05** | [Advanced](lessons/05_advanced_window_functions.sql) | `RANK()`, `PARTITION BY`, Window Functions |

## 🛠 Prerequisites
- Python installed.
- Libraries: `pandas`, `tabulate`.
  ```bash
  pip install pandas tabulate
  ```

## 🧠 Why this project?
This repo is designed to be "code-along" experience. Open the `.sql` files to read the comments and explanations, then run them to see the result on real data!
