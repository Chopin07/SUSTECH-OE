from __future__ import annotations

import html
import math
import zipfile
from pathlib import Path
from xml.sax.saxutils import escape

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parent
FIG_DIR = ROOT / "figures"
M_FILE = ROOT / "lab4_code.m"
MLX_FILE = ROOT / "lab4_code.mlx"
MLX_TEMPLATE = ROOT.parent / "lab4_hw.mlx"


def simulate_particle(m: float, q: float, e: np.ndarray, b: np.ndarray, dt: float, t_end: float, v0: np.ndarray):
    t = np.arange(0.0, t_end + dt, dt)
    r = np.zeros((t.size, 3), dtype=float)
    v = np.zeros((t.size, 3), dtype=float)
    v[0] = v0

    for i in range(t.size - 1):
        force = q * e + q * np.cross(v[i], b)
        accel = force / m
        v[i + 1] = v[i] + accel * dt
        r[i + 1] = r[i] + v[i] * dt

    return t, r, v


def build_figures() -> None:
    FIG_DIR.mkdir(exist_ok=True)

    m = 0.02
    q = 1.6e-2
    e = np.array([0.0, 0.0, 0.0])
    b = np.array([0.0, 0.0, 8.0])
    dt = 0.001
    t_ends = [1, 3, 8, 20, 100]
    cmap = plt.cm.tab20(np.linspace(0, 1, 16))

    for t_end in t_ends:
        fig = plt.figure(figsize=(15, 5.3), constrained_layout=False)
        ax1 = fig.add_subplot(1, 3, 1, projection="3d")
        ax2 = fig.add_subplot(1, 3, 2)
        ax3 = fig.add_subplot(1, 3, 3)
        fig.subplots_adjust(top=0.80, bottom=0.17, left=0.05, right=0.98, wspace=0.15)
        fig.suptitle(
            f"Magnetic Focusing of Charged Particles (t = {t_end} s)\nHe Yanning, 12311512",
            fontsize=13,
            fontweight="bold",
            y=0.96,
        )

        final_speed = None
        final_radius = None

        for k in range(16):
            v0 = np.array([0.1 * math.sin(k * math.pi / 8), 0.1 * math.cos(k * math.pi / 8), 10.0])
            _, r, v = simulate_particle(m, q, e, b, dt, t_end, v0)

            ax1.plot(r[:, 0], r[:, 1], r[:, 2], color=cmap[k], linewidth=1.0)
            ax2.plot(r[:, 0], r[:, 1], color=cmap[k], linewidth=1.0)
            ax3.plot(r[:, 0], r[:, 2], color=cmap[k], linewidth=1.0)

            if k == 0:
                final_speed = np.linalg.norm(v[-1])
                final_radius = np.hypot(r[-1, 0], r[-1, 1])

        ax1.set_title("3D Trajectories")
        ax1.set_xlabel("x (m)")
        ax1.set_ylabel("y (m)")
        ax1.set_zlabel("z (m)")
        ax1.grid(True)

        ax2.set_title("Top View (x-y)")
        ax2.set_xlabel("x (m)")
        ax2.set_ylabel("y (m)")
        ax2.axis("equal")
        ax2.grid(True)

        ax3.set_title("Front View (x-z)")
        ax3.set_xlabel("x (m)")
        ax3.set_ylabel("z (m)")
        ax3.grid(True)

        fig.text(
            0.5,
            0.06,
            (
                f"m = {m:.3f} kg, q = {q:.4f} C, |B| = {np.linalg.norm(b):.1f} T, dt = {dt:.4f} s, "
                f"sample final speed = {final_speed:.4f} m/s, sample final radius = {final_radius:.4f} m"
            ),
            ha="center",
            fontsize=9,
        )

        out_path = FIG_DIR / f"magnetic_focusing_t{t_end}.png"
        fig.savefig(out_path, dpi=220, bbox_inches="tight")
        plt.close(fig)


def build_mlx() -> None:
    code_text = M_FILE.read_text(encoding="utf-8")
    cdata = code_text.replace("]]>", "]]]]><![CDATA[>")
    document_xml = (
        '<?xml version="1.0" encoding="UTF-8"?>'
        '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
        "<w:body><w:p><w:pPr><w:pStyle w:val=\"code\"/></w:pPr><w:r><w:t><![CDATA["
        f"{cdata}"
        "]]></w:t></w:r></w:p></w:body></w:document>"
    )
    if MLX_TEMPLATE.exists():
        with zipfile.ZipFile(MLX_TEMPLATE, "r") as src, zipfile.ZipFile(MLX_FILE, "w", compression=zipfile.ZIP_DEFLATED) as dst:
            for info in src.infolist():
                data = src.read(info.filename)
                if info.filename == "matlab/document.xml":
                    data = document_xml.encode("utf-8")
                dst.writestr(info.filename, data)
    else:
        raise FileNotFoundError(f"MLX template not found: {MLX_TEMPLATE}")


if __name__ == "__main__":
    build_figures()
    build_mlx()
    print(f"Generated figures in {FIG_DIR}")
    print(f"Generated live script at {MLX_FILE}")
