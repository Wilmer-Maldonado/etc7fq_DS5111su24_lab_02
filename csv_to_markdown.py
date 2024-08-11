import pandas as pd

df = pd.read_csv('results/result10b.csv')
markdown_table = df.to_markdown(index=False)
print(markdown_table)
