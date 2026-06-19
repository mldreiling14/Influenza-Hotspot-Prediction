.PHONY: all clean dirs data missingness exploratory model predictions hotspots roc validation figures run

R = Rscript

all: dirs data missingness exploratory model predictions hotspots roc validation figures

run: all

dirs:
	mkdir -p derived_data figures

data: derived_data/final_analysis_dataset.csv

derived_data/final_analysis_dataset.csv: R/01_build_analysis_dataset.R
	$(R) R/01_build_analysis_dataset.R

missingness: derived_data/missing_data_summary.csv

derived_data/missing_data_summary.csv: R/02_missingness_and_variable_screening.R derived_data/final_analysis_dataset.csv
	$(R) R/02_missingness_and_variable_screening.R

exploratory: derived_data/exploratory_hotspot_tests.csv

derived_data/exploratory_hotspot_tests.csv: R/03_exploratory_hotspot_tests.R derived_data/analysis_data_clean.csv
	$(R) R/03_exploratory_hotspot_tests.R

model: derived_data/final_nb_model.rds

derived_data/final_nb_model.rds: R/04_final_negative_binomial_model.R derived_data/final_analysis_dataset.csv
	$(R) R/04_final_negative_binomial_model.R

predictions: derived_data/predictions.csv

derived_data/predictions.csv: R/05_generate_predictions.R derived_data/final_nb_model.rds derived_data/data_final_scaled.csv derived_data/data_final_unscaled.csv
	$(R) R/05_generate_predictions.R

hotspots: derived_data/hotspot_results.csv

derived_data/hotspot_results.csv: R/06_hotspot_classification.R derived_data/predictions.csv
	$(R) R/06_hotspot_classification.R

roc: figures/roc_curve.png

figures/roc_curve.png: R/07_roc_analysis.R derived_data/hotspot_results.csv
	$(R) R/07_roc_analysis.R

validation: derived_data/train_test_validation_auc.csv

derived_data/train_test_validation_auc.csv: R/08_train_test_validation.R derived_data/data_final_unscaled.csv
	$(R) R/08_train_test_validation.R

figures: figures/observed_vs_predicted.png figures/top_predicted_hotspot_counties.png

figures/observed_vs_predicted.png figures/top_predicted_hotspot_counties.png: R/09_make_figures.R derived_data/hotspot_results.csv
	$(R) R/09_make_figures.R

clean:
	rm -f derived_data/*.csv
	rm -f derived_data/*.rds
	rm -f figures/*.png