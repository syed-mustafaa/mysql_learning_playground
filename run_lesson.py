import sqlite3
import pandas as pd
import sys
import os
from tabulate import tabulate

DB_NAME = "company.db"

def run_sql_file(filename):
    if not os.path.exists(filename):
        print(f"Error: File {filename} not found.")
        return

    print(f"\n--- Running: {filename} ---")
    
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    
    with open(filename, 'r') as f:
        sql_script = f.read()

    # Split script into individual statements (roughly) by semicolon
    # This is a simple parser for demonstration.
    statements = sql_script.split(';')
    
    for statement in statements:
        if statement.strip():
            # Extract comments for context
            lines = statement.strip().split('\n')
            comments = [line for line in lines if line.strip().startswith('--')]
            query_lines = [line for line in lines if not line.strip().startswith('--')]
            query = '\n'.join(query_lines)
            
            if not query.strip():
                continue

            print("\n" + "="*50)
            if comments:
                print("\n".join(comments))
            print("-" * 20)
            print(f"QUERY:\n{query.strip()}")
            print("-" * 20)
            
            try:
                # Use pandas to nicely format the output
                df = pd.read_sql_query(query, conn)
                if not df.empty:
                    print(tabulate(df, headers='keys', tablefmt='psql', showindex=False))
                else:
                    print("(No results returned, or empty result set)")
            except Exception as e:
                print(f"Error executing query: {e}")
    
    conn.close()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python run_lesson.py <path_to_sql_file>")
        print("Example: python run_lesson.py lessons/01_basic_retrieval.sql")
    else:
        run_sql_file(sys.argv[1])
