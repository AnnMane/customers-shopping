import psycopg2
import pandas as pd
import sqlalchemy
import os

# Dane logowania do PostgreSQL
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_DBNAME = os.getenv("DB_DBNAME", "goodreads_books")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "password")

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


except Exception as e:
    print("❌ Błąd połączenia:", e)
    print("Upewnij się, że PostgreSQL działa i dane logowania są poprawne.")
    exit(1)