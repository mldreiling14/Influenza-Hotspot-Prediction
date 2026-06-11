library(tidyverse)
library(MASS)
library(broom)
library(car)

data <- read_csv("derived_data/final_analysis_dataset.csv", show_col_types = FALSE) |>
  clean_names()

predictor_vars_final <- c(
  "poor_or_fair_health_raw_value",
  "mean_temp_f",
  "mean_humidity_percent",
  "unemployment_raw_value",
  "gdp",
  "children_in_poverty_raw_value",
  "uninsured_raw_value"
)

data_final <- data |>
  mutate(
    population = population_raw_value
  ) |>
  dplyr::select(
    county,
    fips,
    year,
    population,
    total_cases,
    all_of(predictor_vars_final)
  ) |>
  filter(
    !is.na(total_cases),
    !is.na(population),
    population > 0
  ) |>
  drop_na(all_of(predictor_vars_final))

data_final_scaled <- data_final |>
  mutate(
    across(
      all_of(predictor_vars_final),
      ~ as.numeric(scale(.))
    )
  )

nb_formula_final <- as.formula(
  paste(
    "total_cases ~",
    paste(predictor_vars_final, collapse = " + "),
    "+ offset(log(population))"
  )
)

final_nb_model <- glm.nb(
  nb_formula_final,
  data = data_final_scaled
)

model_coefficients <- tidy(
  final_nb_model,
  exponentiate = TRUE,
  conf.int = TRUE
)

vif_results <- tibble(
  variable = names(vif(final_nb_model)),
  vif = as.numeric(vif(final_nb_model))
)

saveRDS(final_nb_model, "derived_data/final_nb_model.rds")
write_csv(data_final, "derived_data/data_final_unscaled.csv")
write_csv(data_final_scaled, "derived_data/data_final_scaled.csv")
write_csv(model_coefficients, "derived_data/final_model_coefficients.csv")
write_csv(vif_results, "derived_data/final_model_vif.csv")