import pandas as pd
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="YOUR_MYSQL_PASSWORD",
    database="ecommerce_analytics"
)

cursor = conn.cursor()

insert_query = """
INSERT INTO raw_online_retail
(invoice_no, stock_code, description, quantity, invoice_date, price, customer_id, country)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
"""

chunksize = 5000

for chunk in pd.read_csv(
    r"C:\mysql_data\online_retail_II.csv",
    encoding="latin1",
    chunksize=chunksize
):
    chunk.columns = [
        "invoice_no",
        "stock_code",
        "description",
        "quantity",
        "invoice_date",
        "price",
        "customer_id",
        "country"
    ]

    data = [tuple(row) for row in chunk.to_numpy()]
    cursor.executemany(insert_query, data)
    conn.commit()

    print(f"Inserted {len(data)} rows")

cursor.close()
conn.close()

print("✅ Data load completed")
