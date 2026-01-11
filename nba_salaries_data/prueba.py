import sqlite3

conn = sqlite3.connect("nba_salaries.db")
cursor = conn.cursor()

cursor.execute("""
SELECT p.player_name, s.salary_usd
FROM players p
JOIN salaries s ON p.player_id = s.player_id
ORDER BY s.salary_usd DESC
LIMIT 10
""")

for row in cursor.fetchall():
    print(row)

conn.close()
