import pandas as pd
import os

df = pd.read_csv('train_N14.csv')

column_b = df.iloc[:, 1].tolist()  # iloc[:, 1] 获取第二列（B列）

print(column_b)
print(len(column_b))

directory_path = ''

file_names = [f for f in os.listdir(directory_path) if os.path.isfile(os.path.join(directory_path, f))]

print(file_names)


