library(tidyverse)

model <- readRDS("derived_data/final_nb_model.rds")

data_final <- read_csv("derived_data/data_final_unscaled.csv", show_col_types = FALSE)
data_final_scaled <- read_csv("derived_data/data_final_scaled.csv", show_col_types = FALSE)

predictions <- data_final |>
  mutate(
    predicted_cases = predict(
      model,
      newdata = data_final_scaled,
      type = "response"
    ),
    predicted_rate = (predicted_cases / population) * 100000,
    actual_rate = (total_cases / population) * 100000
  )

write_csv(predictions, "derived_data/predictions.csv")