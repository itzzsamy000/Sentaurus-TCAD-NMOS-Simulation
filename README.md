# Sentaurus-TCAD-NMOS-Simulation

2D NMOS device setup and electrical simulation using Synopsys Sentaurus TCAD.

## Project contents

- `*.scm` and `*.sat`: Sentaurus Structure Editor scripts and geometry data.
- `nmos_msh.cmd` and `mosfet_msh.cmd`: mesh and doping-profile setup files.
- `nmos_bnd.tdr` and `nmos_msh.tdr`: generated boundary and mesh data.
- `Satish*_des.cmd`: Sentaurus Device simulation decks. The decks use `nmos_msh.tdr` as their grid and `models_Si.par` for silicon model parameters.
- `*.plt`: current and curve data, including Id-Vg results.
- `*.tdr`: device structure and simulation results for inspection in Sentaurus Visual.
- `*.log`: simulator output and diagnostic logs. `print.pdf` is a generated report.

## Running a simulation

Use a licensed Synopsys Sentaurus TCAD installation with the tools needed to edit or generate the structure and mesh, run Sentaurus Device, and inspect results in Sentaurus Visual.

1. Open the project in Sentaurus Workbench, or use the matching Sentaurus tools for each stage.
2. Ensure the mesh file `nmos_msh.tdr` is available. The supplied device decks expect it in the run directory, along with `models_Si.par`.
3. Run a device deck such as `Satish01_des.cmd`, `Satish02_des.cmd`, or `Satish03_des.cmd`.
4. Inspect generated `.plt` curves and `.tdr` results in Sentaurus Visual; check the corresponding `.log` file for convergence and run details.

The repository includes generated mesh, curve, and result files, so existing results can be inspected without rerunning the simulations.

## Simulation Workflow & Screenshots

All results are visualized in **Sentaurus Visual**. The screenshots follow the 3-stage TCAD simulation pipeline below.

---

```
┌─────────────────────────────────────────────────────────────┐
│              NMOS TCAD SIMULATION FLOW                      │
│                                                             │
│  STAGE 1: Device Structure & Mesh Generation                │
│  ├── Step 1 → NMOS Mesh + Doping Concentration             │
│  └── Step 2 → Phosphorus Active Concentration Profile       │
│                          │                                  │
│                          ▼                                  │
│  STAGE 2: Electrical Simulation (Sentaurus Device)          │
│  ├── Step 3 → Reference Id-Vg (linear, Ioff analysis)      │
│  ├── Step 4 → Reference Id-Vg (linear, IDsat analysis)     │
│  └── Step 5 → Device Structure + Id-Vg + Band Diagram      │
│                          │                                  │
│                          ▼                                  │
│  STAGE 3: Post-Processing & Comparative Analysis            │
│  ├── Step 6 → Full Sentaurus Visual view (Id-Vg + Bands)   │
│  ├── Step 7 → Id-Vg comparison: 3 simulation variants      │
│  └── Step 8 → Id-Vg comparison: all 4 curves + REFERENCE  │
└─────────────────────────────────────────────────────────────┘
```

---

### 🔷 Stage 1 — Device Structure & Mesh Generation

> Geometry is built in Sentaurus Structure Editor and meshed using `nmos_msh.cmd`. Doping profiles are defined for source, drain, channel, and substrate.

**Step 1 — NMOS Mesh with Doping Concentration**
Triangular mesh overlaid on the 2D NMOS cross-section, with colour-mapped doping concentration (`cm⁻³`). Source and drain n+ regions are visible in red.

![Step 1 – NMOS Mesh + Doping](screenshot/Screenshot%202026-09-13%20150042.png)

---

**Step 2 — Phosphorus Active Concentration Profile**
Smooth doping contour map showing Phosphorus active concentration across the device. Highlights the n+ source/drain implants and the lightly-doped p-substrate.

![Step 2 – Phosphorus Active Concentration](screenshot/Screenshot%202026-09-13%20150154.png)

---

### 🔷 Stage 2 — Electrical Simulation (Sentaurus Device)

> Device decks (`Satish01_des.cmd`, `Satish02_des.cmd`, `Satish03_des.cmd`) sweep the gate voltage to generate Id-Vg transfer characteristics and extract key parameters.

**Step 3 — Reference Id-Vg (Ioff extraction)**
Linear-scale Id-Vg for `REFERENCE_des`. The curve properties panel shows `Ioff = 1.58096e-18 A`, confirming excellent subthreshold leakage.

![Step 3 – Reference Id-Vg (Ioff)](screenshot/Screenshot%202026-09-15%20121521.png)

---

**Step 4 — Reference Id-Vg (IDsat extraction)**
Same reference simulation with `IDsat = 1.64026e-05 A` extracted. The curve rises sharply above threshold, indicating strong inversion.

![Step 4 – Reference Id-Vg (IDsat)](screenshot/Screenshot%202026-09-14%20140110.png)

---

**Step 5 — Device Cross-Section + Id-Vg + Band Diagram**
Multi-panel view: Id-Vg transfer curve (top-left), 2D NMOS device cross-section with BandGap colour map (top-right), and energy band diagrams Ec, Ev, Efn, Efp through the channel (bottom panels).

![Step 5 – Device + Id-Vg + Band Diagram](screenshot/Screenshot%202026-09-13%20145437.png)

---

### 🔷 Stage 3 — Post-Processing & Comparative Analysis

> Results from multiple simulation variants are overlaid in Sentaurus Visual to compare threshold voltage, drive current, and subthreshold slope.

**Step 6 — Full Sentaurus Visual Overview**
Complete Sentaurus Visual workspace: Id-Vg plot (top-left), NMOS cross-section BandGap map (top-right), and dual band diagrams (bottom). Confirms all data loaded correctly.

![Step 6 – Full Sentaurus Visual Overview](screenshot/Screenshot%202026-09-13%20125354.png)

---

**Step 7 — Id-Vg Comparison: 3 Simulation Variants (log scale)**
Overlay of three Id-Vg curves — `satish_des` (red), `satish01_des` (green), `satish02_des` (blue) — on a log-scale Y-axis. Shows threshold voltage shift and subthreshold slope variation across device variants.

![Step 7 – Id-Vg 3-Curve Comparison](screenshot/Screenshot%202026-09-13%20142335.png)

---

**Step 8 — Id-Vg Comparison: All 4 Curves Including REFERENCE (log scale)**
Final comparative plot adding `REFERENCE_des` (cyan) to the three-variant overlay. Used to validate simulation accuracy against the reference device and benchmark performance.

![Step 8 – Id-Vg Full Comparison with Reference](screenshot/Screenshot%202026-09-13%20142523.png)

## Environment and licensing

- Review Sentaurus project paths before running on another machine. For example, `nmos_msh.cmd` contains an output path under `/home/administrator/sateesh/` that may need to be changed.
- `models_Si.par` contains Synopsys-proprietary material. Its use and redistribution are subject to the applicable written Synopsys license agreement.
