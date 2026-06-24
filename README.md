# Influenza Hotspot Prediction

This project uses R to prepare New York influenza and county-level data, fit a
negative binomial model, identify predicted influenza hotspots, evaluate the
model, and generate figures.

## Requirements

- R 4.0 or newer
- GNU Make (required only for the Makefile workflow)
- An internet connection for the initial package installation

The required source files are included in `source_data/`.

## Run the project locally

Open a terminal in the repository root. All commands must be run from this
directory because the scripts use project-relative file paths.

### Option 1: Use the Makefile

This is the simplest way to run the complete pipeline. On Windows, run these
commands from Git Bash, WSL, or another Unix-compatible shell with GNU Make
installed. On macOS or Linux, use a regular terminal.

Install missing R packages and create the output directories:

```bash
make setup
```

Run the complete analysis:

```bash
make run
```

You can also run individual stages. Make automatically runs any required
earlier stages:

```bash
make data
make exploratory
make model
make predictions
make hotspots
make roc
make validation
make figures
```

To remove generated files and rebuild the project:

```bash
make clean
make run
```

### Option 2: Run the R scripts directly

Use this option if GNU Make is not installed.

### 1. Create the output directories

In PowerShell:

```powershell
New-Item -ItemType Directory -Force derived_data, figures | Out-Null
```

In macOS or Linux:

```bash
mkdir -p derived_data figures
```

### 2. Install the R packages

```powershell
Rscript --vanilla 00_install_packages.R
```

This installs any missing packages from CRAN. It only needs to be rerun when a
required package is missing.

### 3. Run the analysis pipeline

Run the scripts in numerical order:

```powershell
Rscript --vanilla 01_final_analysis_dataset.R
Rscript --vanilla 02_exploratory_hotspot_tests.R
Rscript --vanilla 03_final_negative_binomial_model.R
Rscript --vanilla 04_generate_predictions.R
Rscript --vanilla 05_hotspot_classification.R
Rscript --vanilla 06_roc_analysis.R
Rscript --vanilla 07_train_test_validation.R
Rscript --vanilla 08_make_figures.R
```

Each script reads outputs created by earlier scripts, so do not change the
order.

## Outputs

The pipeline writes:

- Cleaned datasets, model files, predictions, hotspot classifications, and
  evaluation results to `derived_data/`
- ROC, observed-versus-predicted, and predicted-hotspot plots to `figures/`

The main results include:

- `derived_data/hotspot_results.csv`
- `derived_data/final_model_coefficients.csv`
- `derived_data/train_test_validation_auc.csv`
- `figures/roc_curve.png`
- `figures/observed_vs_predicted.png`
- `figures/top_predicted_hotspot_counties.png`

## RStudio

You can also open the repository folder as an RStudio project or working
directory. Run `00_install_packages.R` first, then run scripts `01` through `08`
in order. Confirm that the working directory is the repository root with:

```r
getwd()
```
