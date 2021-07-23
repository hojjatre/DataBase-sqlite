import sqlite3

def create_connection(db_file):
    conn = sqlite3.connect(db_file)

if __name__ == '__main__':
    create_connection(r"db_pro.db")


