library(tidyverse)
library(broom)

data <- read_csv("derived_data/analysis_data_clean.csv", show_col_types = FALSE)

analysis_subset <- data |>
  dplyr::select(
    fips, year, total_cases,
    population = population_raw_value,
    temp = mean_temp_f,
    humidity = mean_humidity_percent,
    uninsured = uninsured_raw_value,
    hospital_stays = preventable_hospital_stays_raw_value,
    income = median_household_income_raw_value
  ) |>
  mutate(
    hotspot = if_else(
      total_cases >= quantile(total_cases, 0.80, na.rm = TRUE),
      1, 0
    )
  )

test_predictor <- function(var, data) {
  temp_data <- data |>
    dplyr::select(hotspot, dplyr::all_of(var)) |>
    tidyr::drop_na()
  
  model <- glm(
    as.formula(paste("hotspot ~", var)),
    data = temp_data,
    family = binomial
  )
  
  tidy(model, conf.int = TRUE) |>
    filter(term != "(Intercept)") |>
    mutate(
      predictor = var,
      odds_ratio = exp(estimate),
      conf_low_or = exp(conf.low),
      conf_high_or = exp(conf.high)
    )
}

predictors_to_test <- c(
  "temp",
  "humidity",
  "uninsured",
  "hospital_stays",
  "income"
)

exploratory_results <- map_dfr(
  predictors_to_test,
  test_predictor,
  data = analysis_subset
)

write_csv(exploratory_results, "derived_data/exploratory_hotspot_tests.csv")
