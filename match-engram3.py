import mysql.connector
from nltk import ngrams

def get_ngrams(text, n):
    return set(ngrams(text.lower(), n))

def match_prompt_with_mysql(prompt, cursor, database_name):
    best_match = None
    best_ratio = 0.0
    equal_ratios = False

    prompt_ngrams = get_ngrams(prompt, 3)

    # Mendapatkan daftar nama tabel dalam database
    query_tables = f"SHOW TABLES FROM {database_name}"
    cursor.execute(query_tables)
    tables = [table[0] for table in cursor]

    for table_name in tables:
        query = f"SELECT * FROM {table_name}"
        cursor.execute(query)

        # Mengumpulkan ngrams dari setiap kolom dalam tabel
        table_ngrams = set()
        for row in cursor:
            for value in row:
                if value is not None:
                    table_ngrams.update(get_ngrams(str(value), 3))

        # Menghitung rasio kecocokan
        total_ratio = len(prompt_ngrams.intersection(table_ngrams)) / len(prompt_ngrams)

        print(f"\nNama Tabel: {table_name}\nKecocokan: {total_ratio * 100:.1f}%")

        if total_ratio > best_ratio:
            best_ratio = total_ratio
            best_match = table_name
            equal_ratios = False
        elif total_ratio == best_ratio:
            equal_ratios = True

    if equal_ratios:
        raise ValueError("Berikan prompt yang lebih spesifik!")

    return best_match

while True:
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="coba1_dwh"
    )

    cursor = db_connection.cursor()

    user_prompt = input("\nMasukkan prompt: ")

    try:
        result = match_prompt_with_mysql(user_prompt, cursor, "coba1_dwh")

        if result:
            print("\nTabel yang cocok:", result)
        else:
            print("\nTidak ada hasil pencocokan.")
    except ValueError as e:
        print(f"\nError: {e}")

    cursor.close()
    db_connection.close()

    ulang = input("Keluar dari program? (y): ")
    if ulang.lower() == 'y':
        break