<<<<<<< ours
<<<<<<< ours
<<<<<<< ours
<<<<<<< ours
<<<<<<< ours
<<<<<<< ours
<<<<<<< ours
<<<<<<< ours
.PHONY: all clean dirs data exploratory model predictions hotspots roc validation figures run install packages setup

R = Rscript

<<<<<<< ours
=======
SOURCE_DATA = \
	source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	source_data/weather_data.csv \
	source_data/seasonal_weather.csv \
	source_data/NY_GDP_Data.csv \
	$(wildcard source_data/analytic_data*.csv)

DATA_SCRIPT = 01_final_analysis_dataset.R
EXPLORATORY_SCRIPT = 02_exploratory_hotspot_tests.R
MODEL_SCRIPT = 03_final_negative_binomial_model.R
PREDICTIONS_SCRIPT = 04_generate_predictions.R
HOTSPOTS_SCRIPT = 05_hotspot_classification.R
ROC_SCRIPT = 06_roc_analysis.R
VALIDATION_SCRIPT = 07_train_test_validation.R
FIGURES_SCRIPT = 08_make_figures.R

DATA_OUTPUTS = \
	derived_data/final_analysis_dataset.csv \
	derived_data/analysis_data_clean.csv \
	derived_data/missing_data_summary.csv

MODEL_OUTPUTS = \
	derived_data/final_nb_model.rds \
	derived_data/data_final_unscaled.csv \
	derived_data/data_final_scaled.csv \
	derived_data/final_model_coefficients.csv \
	derived_data/final_model_vif.csv

ROC_OUTPUTS = \
	figures/roc_curve.png \
	derived_data/auc_results.csv

VALIDATION_OUTPUTS = \
	derived_data/train_test_validation_auc.csv \
	derived_data/test_set_predictions.csv

FIGURE_OUTPUTS = \
	figures/observed_vs_predicted.png \
	figures/top_predicted_hotspot_counties.png

>>>>>>> theirs
all: dirs data exploratory model predictions hotspots roc validation figures

run: all

setup: install dirs

<<<<<<< ours
install packages: 00_install_packages.R
	$(R) 00_install_packages.R

dirs:
	mkdir -p derived_data figures
=======
data: $(DATA_OUTPUTS)
>>>>>>> theirs

data: derived_data/final_analysis_dataset.csv derived_data/analysis_data_clean.csv derived_data/missing_data_summary.csv

<<<<<<< ours
derived_data/final_analysis_dataset.csv derived_data/analysis_data_clean.csv derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R | dirs
	$(R) 01_final_analysis_dataset.R
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean run

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

run: all

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean run

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

run: all

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv

exploratory: derived_data/exploratory_hotspot_tests.csv

model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
>>>>>>> theirs

hotspots: derived_data/hotspot_results.csv

<<<<<<< ours
model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
>>>>>>> theirs

hotspots: derived_data/hotspot_results.csv

<<<<<<< ours
model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
>>>>>>> theirs
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean run

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

run: all

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv

exploratory: derived_data/exploratory_hotspot_tests.csv

model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
=======
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv


derived_data:
	mkdir -p derived_data

figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv


derived_data:
	mkdir -p derived_data

figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
<<<<<<< ours
model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
>>>>>>> theirs
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean run

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

run: all

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv

exploratory: derived_data/exploratory_hotspot_tests.csv

model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
=======
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv


derived_data:
	mkdir -p derived_data

figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv


derived_data:
	mkdir -p derived_data

figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
<<<<<<< ours
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R derived_data/analysis_data_clean.csv | dirs
	$(R) 02_exploratory_hotspot_tests.R

model: derived_data/final_nb_model.rds derived_data/data_final_unscaled.csv derived_data/data_final_scaled.csv derived_data/final_model_coefficients.csv derived_data/final_model_vif.csv

derived_data/final_nb_model.rds derived_data/data_final_unscaled.csv derived_data/data_final_scaled.csv derived_data/final_model_coefficients.csv derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R derived_data/final_analysis_dataset.csv | dirs
	$(R) 03_final_negative_binomial_model.R
=======
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv

>>>>>>> theirs

derived_data:
	mkdir -p derived_data

<<<<<<< ours
derived_data/predictions.csv: 04_generate_predictions.R derived_data/final_nb_model.rds derived_data/data_final_scaled.csv derived_data/data_final_unscaled.csv | dirs
	$(R) 04_generate_predictions.R
=======
figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
derived_data/hotspot_results.csv: 05_hotspot_classification.R derived_data/predictions.csv | dirs
	$(R) 05_hotspot_classification.R

roc: figures/roc_curve.png derived_data/auc_results.csv

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R derived_data/hotspot_results.csv | dirs
	$(R) 06_roc_analysis.R

validation: derived_data/train_test_validation_auc.csv derived_data/test_set_predictions.csv

derived_data/train_test_validation_auc.csv derived_data/test_set_predictions.csv &: 07_train_test_validation.R derived_data/data_final_unscaled.csv | dirs
	$(R) 07_train_test_validation.R
=======
$(DATA_OUTPUTS) &: $(DATA_SCRIPT) $(SOURCE_DATA) | dirs
	$(R) $(DATA_SCRIPT)
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv

exploratory: derived_data/exploratory_hotspot_tests.csv

model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
>>>>>>> theirs
=======
RSCRIPT = Rscript --vanilla

.PHONY: all clean

all: derived_data/final_analysis_dataset.csv \
	 derived_data/analysis_data_clean.csv \
	 derived_data/missing_data_summary.csv \
	 derived_data/exploratory_hotspot_tests.csv \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_unscaled.csv \
	 derived_data/data_final_scaled.csv \
	 derived_data/final_model_coefficients.csv \
	 derived_data/final_model_vif.csv \
	 derived_data/predictions.csv \
	 derived_data/hotspot_results.csv \
	 figures/roc_curve.png \
	 derived_data/auc_results.csv \
	 derived_data/train_test_validation_auc.csv \
	 derived_data/test_set_predictions.csv \
	 figures/observed_vs_predicted.png \
	 figures/top_predicted_hotspot_counties.png

data: derived_data/final_analysis_dataset.csv \
	  derived_data/analysis_data_clean.csv \
	  derived_data/missing_data_summary.csv

missingness: derived_data/missing_data_summary.csv

exploratory: derived_data/exploratory_hotspot_tests.csv

model: derived_data/final_nb_model.rds \
	   derived_data/data_final_unscaled.csv \
	   derived_data/data_final_scaled.csv \
	   derived_data/final_model_coefficients.csv \
	   derived_data/final_model_vif.csv

predictions: derived_data/predictions.csv
=======
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv


derived_data:
	mkdir -p derived_data

figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv


derived_data:
	mkdir -p derived_data

figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
<<<<<<< ours
derived_data/exploratory_hotspot_tests.csv: $(EXPLORATORY_SCRIPT) derived_data/analysis_data_clean.csv | dirs
	$(R) $(EXPLORATORY_SCRIPT)

model: $(MODEL_OUTPUTS)

$(MODEL_OUTPUTS) &: $(MODEL_SCRIPT) derived_data/final_analysis_dataset.csv | dirs
	$(R) $(MODEL_SCRIPT)
=======
roc: figures/roc_curve.png derived_data/auc_results.csv

validation: derived_data/train_test_validation_auc.csv \
		derived_data/test_set_predictions.csv

>>>>>>> theirs

derived_data:
	mkdir -p derived_data

<<<<<<< ours
derived_data/predictions.csv: $(PREDICTIONS_SCRIPT) $(MODEL_OUTPUTS) | dirs
	$(R) $(PREDICTIONS_SCRIPT)
=======
figures:
	mkdir -p figures
>>>>>>> theirs

derived_data/final_analysis_dataset.csv \
derived_data/analysis_data_clean.csv \
derived_data/missing_data_summary.csv &: 01_final_analysis_dataset.R \
	 source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx \
	 source_data/weather_data.csv \
	 source_data/seasonal_weather.csv \
	 source_data/NY_GDP_Data.csv \
	 $(wildcard source_data/analytic_data*.csv) | derived_data
	$(RSCRIPT) 01_final_analysis_dataset.R

<<<<<<< ours
derived_data/hotspot_results.csv: $(HOTSPOTS_SCRIPT) derived_data/predictions.csv | dirs
	$(R) $(HOTSPOTS_SCRIPT)

roc: $(ROC_OUTPUTS)

$(ROC_OUTPUTS) &: $(ROC_SCRIPT) derived_data/hotspot_results.csv | dirs
	$(R) $(ROC_SCRIPT)

validation: $(VALIDATION_OUTPUTS)

$(VALIDATION_OUTPUTS) &: $(VALIDATION_SCRIPT) derived_data/data_final_unscaled.csv | dirs
	$(R) $(VALIDATION_SCRIPT)
>>>>>>> theirs

figures: $(FIGURE_OUTPUTS)

<<<<<<< ours
figures/observed_vs_predicted.png figures/top_predicted_hotspot_counties.png &: 08_make_figures.R derived_data/hotspot_results.csv | dirs
	$(R) 08_make_figures.R
=======
$(FIGURE_OUTPUTS) &: $(FIGURES_SCRIPT) derived_data/hotspot_results.csv | dirs
	$(R) $(FIGURES_SCRIPT)
>>>>>>> theirs

clean:
	rm -f derived_data/*.csv
	rm -f derived_data/*.rds
	rm -f figures/*.png
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
=======
derived_data/exploratory_hotspot_tests.csv: 02_exploratory_hotspot_tests.R \
	 derived_data/analysis_data_clean.csv | derived_data
	$(RSCRIPT) 02_exploratory_hotspot_tests.R

derived_data/final_nb_model.rds \
derived_data/data_final_unscaled.csv \
derived_data/data_final_scaled.csv \
derived_data/final_model_coefficients.csv \
derived_data/final_model_vif.csv &: 03_final_negative_binomial_model.R \
	 derived_data/final_analysis_dataset.csv | derived_data
	$(RSCRIPT) 03_final_negative_binomial_model.R

derived_data/predictions.csv: 04_generate_predictions.R \
	 derived_data/final_nb_model.rds \
	 derived_data/data_final_scaled.csv \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 04_generate_predictions.R

derived_data/hotspot_results.csv: 05_hotspot_classification.R \
	 derived_data/predictions.csv | derived_data
	$(RSCRIPT) 05_hotspot_classification.R

figures/roc_curve.png derived_data/auc_results.csv &: 06_roc_analysis.R \
	 derived_data/hotspot_results.csv | figures derived_data
	$(RSCRIPT) 06_roc_analysis.R

derived_data/train_test_validation_auc.csv \
derived_data/test_set_predictions.csv &: 07_train_test_validation.R \
	 derived_data/data_final_unscaled.csv | derived_data
	$(RSCRIPT) 07_train_test_validation.R

figures/observed_vs_predicted.png \
figures/top_predicted_hotspot_counties.png &: 08_make_figures.R \
	 derived_data/hotspot_results.csv | figures
	$(RSCRIPT) 08_make_figures.R

clean:
	rm -rf figures
	rm -rf derived_data
>>>>>>> theirs
