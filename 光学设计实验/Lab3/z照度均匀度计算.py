import pandas as pd

# === 1. 读取 Excel 文件 ===
# 请将文件名修改为你的实际文件路径
file_path = "z0.1-3.0.xlsx"
df = pd.read_excel(file_path)

# === 2. 从指定单元格读取数据 ===
# 注意：pandas的DataFrame是按行列索引读取的，这里用.iloc定位。
# Excel单元格V22表示第22行、第22列（rownumber-2）。
# pandas是从0开始计数的，所以行索引应为21，列索引应为(对应列字母的编号-1)。

def cell_value(df, cell):
    """将Excel单元格坐标(如'V22')转换为数值"""
    # 列字母转数字
    col_letters = ''.join(filter(str.isalpha, cell))
    row_number = int(''.join(filter(str.isdigit, cell)))
    # 列字母转为列索引
    col_index = 0
    for ch in col_letters:
        col_index = col_index * 26 + (ord(ch.upper()) - ord('A')) + 1
    # DataFrame 行列是从0开始的
    return df.iloc[row_number-2, col_index - 1]

# === 3. 提取指定数据 ===
V22 = cell_value(df, "V22")
V65 = cell_value(df, "V65")
BM22 = cell_value(df, "BM22")
BM65 = cell_value(df, "BM65")

V107 = cell_value(df, "V107")
V108 = cell_value(df, "V108")
BM107 = cell_value(df, "BM107")
BM108 = cell_value(df, "BM108")

DC22 = cell_value(df, "DC22")
DD22 = cell_value(df, "DD22")
DC65 = cell_value(df, "DC65")
DD65 = cell_value(df, "DD65")
DC107 = cell_value(df, "DC107")
DD107 = cell_value(df, "DD107")
DC108 = cell_value(df, "DC108")
DD108 = cell_value(df, "DD108")

# === 4. 计算平均值 ===
val1 = (V107 + V108) / 2
val2 = (BM107 + BM108) / 2
val3 = (DC22 + DD22) / 2
val4 = (DC65 + DD65) / 2
val5 = (DC107 + DD107 + DC108 + DD108) / 4

# === 5. 组成九个数据 ===
data_list = [V22, V65, BM22, BM65, val1, val2, val3, val4, val5]

# === 6. 计算平均值与照度均匀度 ===
average_value = sum(data_list) / len(data_list)
uniformity = min(data_list) / average_value

# === 7. 打印结果 ===
print("\n九个数据分别为：")
for i, val in enumerate(data_list, start=1):
    print(f"数据{i}: {val}")

print(f"\n九个数据的平均值：{average_value}")
print(f"照度均匀度 = 最小值 / 平均值 = {uniformity}\n")

