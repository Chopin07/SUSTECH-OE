import numpy as np
import matplotlib.pyplot as plt

# 常数
k = 8.617e-5  # eV/K，玻尔兹曼常数
T = np.linspace(1, 1000, 1000)  # 温度范围 1K 到 1000K
N_D = 1e15  # 掺杂浓度 cm^-3
E_D = 0.045  # 施主能级深度 eV（硅典型施主）

# 本征载流子浓度
n_i = 1.5e10 * np.exp(-1.12/(2*k*T))  # 简化公式，单位 cm^-3

# 冻结区到激活区，施主电子浓度
n_donor = N_D / (1 + 0.5*np.exp(E_D/(k*T)))  # Fermi-Dirac简化

# 取电子浓度为施主电子和本征电子的最大值
n_total = np.maximum(n_donor, n_i)

# 绘图
plt.figure(figsize=(8,6))
plt.semilogy(T, n_total, label='电子浓度 n(T)')
plt.axvline(x=100, color='gray', linestyle='--', alpha=0.5, label='冻结区→激活区')
plt.axvline(x=600, color='red', linestyle='--', alpha=0.5, label='激活区→本征区')
plt.xlabel('温度 T (K)')
plt.ylabel('电子浓度 n (cm⁻³)')
plt.title('掺杂硅样品电子浓度随温度变化')
plt.legend()
plt.grid(True, which='both', linestyle='--', alpha=0.5)
plt.show()
