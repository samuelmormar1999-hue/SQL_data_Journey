import pandas as pd

# 1. Load raw CSV
df = pd.read_csv("nba_2022-23_all_stats_with_salary.csv")

# 2. Normalize column names
df.columns = (
    df.columns
    .str.lower()
    .str.strip()
    .str.replace(" ", "_")
)

# 3. Remove unnecessary column (index from CSV)
df = df.drop(columns=["unnamed:_0"])

# 4. Select relevant columns
df_clean = df[
    [
        "player_name",
        "team",
        "salary",
    ]
].copy()

# 5. Clean salary column
df_clean["salary"] = (
    df_clean["salary"]
    .astype(str)
    .str.replace("$", "", regex=False)
    .str.replace(",", "", regex=False)
)

# Keep only numeric salaries
df_clean = df_clean[df_clean["salary"].str.isnumeric()]
df_clean["salary"] = df_clean["salary"].astype(int)

# 6. Export clean CSV
df_clean.to_csv("nba_salaries_clean.csv", index=False)

print("nba_salaries_clean.csv")
print(df_clean.head())
