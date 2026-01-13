import pandas as pd
from pathlib import Path
# ===== 解决中文方块/乱码 =====
import matplotlib.pyplot as plt
plt.rcParams["font.family"] = "SimHei"        # Windows 黑体
plt.rcParams["axes.unicode_minus"] = False    # 正常显示负号
# ---------- 通用：读取单个文件并返回指标 ----------
def calc_metrics(file_path: str):
    """返回 (avg, uniformity)"""
    df = pd.read_excel(file_path)

    def cell_value(cell):
        col_letters = ''.join(filter(str.isalpha, cell))
        row = int(''.join(filter(str.isdigit, cell)))
        col = 0
        for ch in col_letters.upper():
            col = col * 26 + (ord(ch) - ord('A') + 1)
        return df.iloc[row - 2, col - 1]

    # 9 个原始值
    V22, V65, BM22, BM65 = map(cell_value, ["V22", "V65", "BM22", "BM65"])
    val1 = (cell_value("V107") + cell_value("V108")) / 2
    val2 = (cell_value("BM107") + cell_value("BM108")) / 2
    val3 = (cell_value("DC22") + cell_value("DD22")) / 2
    val4 = (cell_value("DC65") + cell_value("DD65")) / 2
    val5 = (cell_value("DC107") + cell_value("DD107") +
            cell_value("DC108") + cell_value("DD108")) / 4

    data_list = [V22, V65, BM22, BM65, val1, val2, val3, val4, val5]
    avg = sum(data_list) / 9
    uniformity = min(data_list) / avg
    return avg, uniformity

# ---------- 批量：0.20 ~ 0.25 ----------
summary = []
for d in range(20, 26):          # 0.20 ~ 0.25
    fname = f"{d/100:.2f}.xlsx"
    if Path(fname).exists():
        avg, uni = calc_metrics(fname)
        summary.append({"文件": fname, "平均值(lx)": avg, "照度均匀度": uni})
    else:
        print(f"⚠️ 未找到 {fname}，已跳过")

# ---------- 打印汇总表 ----------
df_summary = pd.DataFrame(summary)
print("\n照度均匀度汇总表（0.20 → 0.25）")
print(df_summary.to_string(index=False))

