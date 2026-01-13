import pandas as pd

# 替换为你的文件路径
#file_path =  r'D:\SUSTech\大三上\光学设计实验\Lab4\ee373 lab4-单自由曲面透镜设计\simulation\zemax\1.5mmlens\1.5.xlsx'
#file_path =  r'D:\SUSTech\大三上\光学设计实验\Lab4\ee373 lab4-单自由曲面透镜设计\simulation\zemax\2mmlens\2.xlsx'
#file_path =  r'D:\SUSTech\大三上\光学设计实验\Lab4\ee373 lab4-单自由曲面透镜设计\simulation\zemax\3mmlens\3.xlsx'
#file_path =  r'D:\SUSTech\大三上\光学设计实验\Lab4\ee373 lab4-单自由曲面透镜设计\simulation\zemax\4mmlens\4.xlsx'
file_path =  r'D:\SUSTech\大三上\光学设计实验\Lab4\ee373 lab4-单自由曲面透镜设计\simulation\zemax\5mmlens\5.xlsx'

# 读取整个Excel文件
data = pd.read_excel(file_path, header=None)

# 提取46-84行和46-84列的数据
# 由于索引从0开始，我们需要减去1
#intersection_data = data.iloc[45:85, 45:85]  # 46-84行和46-84列

# 提取中心行（第65行）和中心列（第65列）的数据
#center_row = intersection_data.iloc[19]  # 第65行，索引为19（45+19=64）
#center_column = intersection_data.iloc[:, 19]  # 第65列，索引为19（45+19=64）

# 提取46-84行和46-84列的数据
# 由于索引从0开始，我们需要减去1
intersection_data = data.iloc[60:80, 60:80]  # 46-84行和46-84列

# 提取中心行（第65行）和中心列（第65列）的数据
center_row = intersection_data.iloc[4]  # 第65行，索引为19（45+19=64）
center_column = intersection_data.iloc[:, 4]  # 第65列，索引为19（45+19=64）

# 合并中心行和中心列的数据，去除重复的中心点数据
center_data = pd.concat([center_row, center_column], ignore_index=True)

# 找出中心行和中心列数据中的最小值
min_value = center_data.min()
max_value = 1.3613E-03
print(f"最小辐照度: {min_value}")
print(f"辐照度均匀度：{min_value/max_value}\n")
