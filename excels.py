import psycopg2
import pandas as pd
import sqlalchemy
import os
import xlsxwriter

# Dane logowania do PostgreSQL
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_DBNAME = os.getenv("DB_DBNAME","customer_shopping_data")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "password")


def connect_to_db_and_execute_query(queries):
    try:
        # Nawiązanie połączenia
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            dbname=DB_DBNAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        print("✅ Połączono z bazą danych!")
        for query in queries:
            df = pd.read_sql_query(query, conn)
            print(df.head())
        conn.close()
        print("✅ Połączenie zamknięte.")
        return df

    except Exception as e:
        print("❌ Błąd połączenia lub wykonania zapytania:", e)
        print("Upewnij się, że PostgreSQL działa i dane logowania są poprawne.")
        return None

def fetch_query_from_file():
    base_file_path = "sql/"
    file_names = os.listdir(base_file_path)
    sql_files = [f for f in os.listdir(base_file_path) if f.endswith('.sql')]
    queries = {}
    for file in sql_files:
        with open(os.path.join(base_file_path, file), 'r') as f:
            queries[file] = f.read()
    return queries, sql_files

def export_to_excel(df, file_name):
    with pd.ExcelWriter(file_name, engine='xlsxwriter') as writer:
        df.to_excel(writer, index=False, sheet_name='Sheet1')
    print(f"✅ Data exported to {file_name}")

def main():
    print("Fetching SQL queries from files...")
    queries, sql_files = fetch_query_from_file()
    print(f"Found {len(queries)} SQL files.")
    for file in sql_files:
        print(f"Executing query from {file}...")
        df = connect_to_db_and_execute_query([queries[file]])
        if df is not None:
            excel_file_name = f"Data/{file.replace('.sql', '.xlsx')}"
            export_to_excel(df, excel_file_name)
        else:
            print(f"Failed to execute query from {file}.")
















if __name__ == "__main__":
    main()











