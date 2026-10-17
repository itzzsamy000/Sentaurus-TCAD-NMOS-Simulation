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

## Environment and licensing

- Review Sentaurus project paths before running on another machine. For example, `nmos_msh.cmd` contains an output path under `/home/administrator/sateesh/` that may need to be changed.
- `models_Si.par` contains Synopsys-proprietary material. Its use and redistribution are subject to the applicable written Synopsys license agreement.
