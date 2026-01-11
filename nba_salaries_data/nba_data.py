import pandas as pd

df = pd.read_csv("nba_2022-23_all_stats_with_salary.csv")

df.columns = df.columns.str.lower().str.strip().str.replace(" ", "_")
print (df.columns)
#%%
df = df.drop(columns=["unnamed:_0"])

#%%
df_clean = df[[
    "player_name",
    "team",
    "salary",
]].copy()

df_clean.head()

#%%
df_clean["salary"] = (
    df_clean["salary"]
    .astype(str)
    .str.replace("$", "", regex = False)
    .str.replace(",", "", regex = False)
)

df_clean = df_clean [df_clean["salary"].str.isnumeric()]
df_clean["salary"] = df_clean["salary"].astype(int)
#%%
df_clean.to_csv("nba_salaries_clean.csv", index=False)