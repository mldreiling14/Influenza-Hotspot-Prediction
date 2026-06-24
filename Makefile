.PHONY: all clean dirs data exploratory model predictions hotspots roc validation figures run install packages setup

R = Rscript

all: dirs data exploratory model predictions hotspots roc validation figures

run: all

setup: install dirs

install packages: 00_install_packages.R
	$(R) 00_install_packages.R

dirs:
	mkdir -p derived_data figures

data: derived_data/final_analysis_dataset.csv derived_data/analysis_data_clean.csv derived_data/missing_data_summary.csv

derived_data/final_analysis_dataset.csv derived_data/analysis_data_clean.csv derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R | dirs
	$(R) 01_final_analysis_dataset.R

hotspots: derived_data/hotspot_results.csv

derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R derived_data/analysis_data_clean.csv | dirs
	$(R) 02_exploratory_hotspot_tests.R

model: derived_data/final_nb_model.rds derived_data/data_final_unscaled.csv derived_data/data_final_scaled.csv derived_data/final_model_coefficients.csv derived_data/final_model_vif.csv

derived_data/final_nb_model.rds derived_data/data_final_unscaled.csv derived_data/data_final_scaled.csv derived_data/final_model_coefficients.csv derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R derived_data/final_analysis_dataset.csv | dirs
	$(R) 03_final_negative_binomial_model.R

derived_data:
	mkdir -p derived_data

derived_data/predictions.csv: 04_generate_predictions.R derived_data/final_nb_model.rds derived_data/data_final_scaled.csv derived_data/data_final_unscaled.csv | dirs
	$(R) 04_generate_predictions.R

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R derived_data/predictions.csv | dirs
	$(R) 05_hotspot_classification.R

roc: figures/roc_curve.png derived_data/auc_results.csv

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R derived_data/hotspot_results.csv | dirs
	$(R) 06_roc_analysis.R

validation: derived_data/train_test_validation_auc.csv derived_data/test_set_predictions.csv

derived_data/train_test_validation_auc.csv derived_data/test_set_predictions.csv &: 07_train_test_validation.R derived_data/data_final_unscaled.csv | dirs
	$(R) 07_train_test_validation.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png figures/top_predicted_hotspot_counties.png &: 08_make_figures.R derived_data/hotspot_results.csv | dirs
	$(R) 08_make_figures.R

clean:
	rm -f derived_data/*.csv
	rm -f derived_data/*.rds
	rm -f figures/*.png
