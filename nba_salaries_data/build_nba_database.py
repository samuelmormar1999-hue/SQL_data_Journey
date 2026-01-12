import pandas as pd
import sqlite3
import os

DB_NAME = "nba_salaries.db"
CSV_NAME = "nba_salaries_clean.csv"
SEASON = "2022-23"

# -------------------------
# 0. Delete database if exists
# -------------------------
if os.path.exists(DB_NAME):
    os.remove(DB_NAME)
    print("Old database deleted")

# -------------------------
# 1. Create database and tables
# -------------------------
conn = sqlite3.connect(DB_NAME)
cursor = conn.cursor()

cursor.executescript("""
CREATE TABLE teams (
    team_id INTEGER PRIMARY KEY AUTOINCREMENT,
    team_name TEXT NOT NULL
);

CREATE TABLE players (
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_name TEXT NOT NULL,
    team_id INTEGER,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE salaries (
    salary_id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER NOT NULL,
    season TEXT NOT NULL,
    salary_usd INTEGER NOT NULL,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);
""")

print("Database schema created")

# -------------------------
# 2. Load CSV
# -------------------------
df = pd.read_csv(CSV_NAME)
df["season"] = SEASON

# -------------------------
# 3. Insert teams
# -------------------------
teams = df["team"].drop_duplicates()

for team in teams:
    cursor.execute(
        "INSERT INTO teams (team_name) VALUES (?)",
        (team,)
    )

print(f"{len(teams)} teams inserted")

# -------------------------
# 4. Insert players
# -------------------------
players = df[["player_name", "team"]].drop_duplicates()

for _, row in players.iterrows():
    cursor.execute(
        """
        INSERT INTO players (player_name, team_id)
        SELECT ?, team_id
        FROM teams
        WHERE team_name = ?
        """,
        (row["player_name"], row["team"])
    )

print(f"{len(players)} players inserted")

# -------------------------
# 5. Insert salaries
# -------------------------
for _, row in df.iterrows():
    cursor.execute(
        """
        INSERT INTO salaries (player_id, season, salary_usd)
        SELECT player_id, ?, ?
        FROM players
        WHERE player_name = ?
        """,
        (row["season"], int(row["salary"]), row["player_name"])
    )

print(f"{len(df)} salaries inserted")

# -------------------------
# 6. Close connection
# -------------------------
conn.commit()
conn.close()

print("NBA SQLite database built successfully")
