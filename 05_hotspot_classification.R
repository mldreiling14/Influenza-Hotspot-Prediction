library(tidyverse)

predictions <- read_csv("derived_data/predictions.csv", show_col_types = FALSE)

actual_top20_threshold <- quantile(
  predictions$actual_rate,
  0.80,
  na.rm = TRUE
)

predicted_top20_threshold <- quantile(
  predictions$predicted_rate,
  0.80,
  na.rm = TRUE
)

statewide_actual_rate <- 
  sum(predictions$total_cases, na.rm = TRUE) /
  sum(predictions$population, na.rm = TRUE) * 100000

statewide_predicted_rate <- 
  sum(predictions$predicted_cases, na.rm = TRUE) /
  sum(predictions$population, na.rm = TRUE) * 100000

hotspot_results <- predictions |>
  mutate(
    actual_hotspot_top20 = if_else(actual_rate >= actual_top20_threshold, 1, 0),
    predicted_hotspot_top20 = if_else(predicted_rate >= predicted_top20_threshold, 1, 0),
    actual_hotspot_15x = if_else(actual_rate > 1.5 * statewide_actual_rate, 1, 0),
    predicted_hotspot_15x = if_else(predicted_rate > 1.5 * statewide_predicted_rate, 1, 0)
  )

write_csv(hotspot_results, "derived_data/hotspot_results.csv")