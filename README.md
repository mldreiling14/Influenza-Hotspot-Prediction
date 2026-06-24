# Influenza Hotspot Prediction

This R project prepares New York influenza and county-level data, fits a
negative binomial model, predicts influenza hotspots, evaluates model
performance, and generates figures.

## Requirements

- R 4.0 or newer
- GNU Make 4.3 or newer
- Internet access for the initial R package installation

The input datasets are included in `source_data/`.

On Windows, run the Make commands from WSL, Git Bash with GNU Make installed,
or another Unix-compatible terminal. Make sure both `Rscript` and `make` are
available on your `PATH`.

Check the installations with:

```bash
Rscript --version
make --version
```

## Run with Make

Open a terminal in the repository root.

Install the required R packages and create the output directories:

```bash
make setup
```

Run the complete analysis pipeline:

```bash
make run
```

Make tracks file dependencies, so running `make run` again only rebuilds
outputs whose inputs or scripts have changed.

### Run individual stages

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

Required earlier stages are run automatically.

### Clean and rebuild

Remove generated CSV, RDS, and PNG files:

```bash
make clean
```

Then rebuild everything:

```bash
make setup
make run
```

## Run without Make

If GNU Make is unavailable, run the scripts directly from the repository root.

First, create the output directories.

PowerShell:

```powershell
New-Item -ItemType Directory -Force derived_data, figures | Out-Null
```

macOS, Linux, WSL, or Git Bash:

```bash
mkdir -p derived_data figures
```

Install the required R packages:

```bash
Rscript --vanilla 00_install_packages.R
```

Run the analysis scripts in order:

```bash
Rscript --vanilla 01_final_analysis_dataset.R
Rscript --vanilla 02_exploratory_hotspot_tests.R
Rscript --vanilla 03_final_negative_binomial_model.R
Rscript --vanilla 04_generate_predictions.R
Rscript --vanilla 05_hotspot_classification.R
Rscript --vanilla 06_roc_analysis.R
Rscript --vanilla 07_train_test_validation.R
Rscript --vanilla 08_make_figures.R
```

The order matters because each script uses files produced by earlier scripts.

## Outputs

Generated datasets, predictions, model files, and evaluation results are saved
in `derived_data/`. Generated plots are saved in `figures/`.

Key outputs include:

- `derived_data/final_model_coefficients.csv`
- `derived_data/hotspot_results.csv`
- `derived_data/train_test_validation_auc.csv`
- `figures/roc_curve.png`
- `figures/observed_vs_predicted.png`
- `figures/top_predicted_hotspot_counties.png`

## RStudio

Open the repository as the working directory. Run
`00_install_packages.R`, followed by scripts `01` through `08` in numerical
order.

Confirm the working directory with:

```r
getwd()
```
