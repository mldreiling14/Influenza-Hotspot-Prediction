library(tidyverse)
library(MASS)
library(pROC)

set.seed(123)

data <- read_csv("derived_data/data_final_unscaled.csv", show_col_types = FALSE)

predictor_vars_final <- c(
  "poor_or_fair_health_raw_value",
  "mean_temp_f",
  "mean_humidity_percent",
  "unemployment_raw_value",
  "gdp",
  "children_in_poverty_raw_value",
  "uninsured_raw_value"
)

nb_formula_final <- as.formula(
  paste(
    "total_cases ~",
    paste(predictor_vars_final, collapse = " + "),
    "+ offset(log(population))"
  )
)

train_idx <- sample(seq_len(nrow(data)), size = 0.80 * nrow(data))

train <- data[train_idx, ]
test <- data[-train_idx, ]

means <- sapply(train[predictor_vars_final], mean, na.rm = TRUE)
sds <- sapply(train[predictor_vars_final], sd, na.rm = TRUE)

train_scaled <- train
test_scaled <- test

for (v in predictor_vars_final) {
  train_scaled[[v]] <- (train[[v]] - means[v]) / sds[v]
  test_scaled[[v]] <- (test[[v]] - means[v]) / sds[v]
}

model_train <- glm.nb(nb_formula_final, data = train_scaled)

test_predictions <- test |>
  mutate(
    predicted_cases = predict(
      model_train,
      newdata = test_scaled,
      type = "response"
    ),
    predicted_rate = (predicted_cases / population) * 100000,
    actual_rate = (total_cases / population) * 100000,
    actual_hotspot_top20 = if_else(
      actual_rate >= quantile(actual_rate, 0.80, na.rm = TRUE),
      1, 0
    )
  )

roc_test <- roc(
  test_predictions$actual_hotspot_top20,
  test_predictions$predicted_rate
)

validation_results <- tibble(
  validation_type = "80/20 train-test split",
  hotspot_definition = "Top 20%",
  auc = as.numeric(auc(roc_test))
)

write_csv(test_predictions, "derived_data/test_set_predictions.csv")
write_csv(validation_results, "derived_data/train_test_validation_auc.csv")