library(tidyverse)
library(pROC)

dir.create("figures", showWarnings = FALSE)

data <- read_csv("derived_data/hotspot_results.csv", show_col_types = FALSE)

roc_top20 <- roc(
  data$actual_hotspot_top20,
  data$predicted_rate
)

roc_15x <- roc(
  data$actual_hotspot_15x,
  data$predicted_rate
)

auc_top20 <- round(auc(roc_top20), 3)
auc_15x <- round(auc(roc_15x), 3)

roc_df <- bind_rows(
  tibble(
    fpr = 1 - roc_top20$specificities,
    tpr = roc_top20$sensitivities,
    model = "Top 20%"
  ),
  tibble(
    fpr = 1 - roc_15x$specificities,
    tpr = roc_15x$sensitivities,
    model = "1.5x statewide rate"
  )
)

roc_plot <- ggplot(roc_df, aes(x = fpr, y = tpr, color = model)) +
  geom_abline(linetype = "dashed", color = "gray50") +
  geom_line(linewidth = 1.2) +
  coord_equal() +
  labs(
    title = "ROC Curve: Flu Hotspot Prediction",
    subtitle = paste0(
      "Top 20% AUC = ", auc_top20,
      " | 1.5x AUC = ", auc_15x
    ),
    x = "False Positive Rate",
    y = "True Positive Rate",
    color = "Hotspot Definition"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "bottom"
  )

ggsave("figures/roc_curve.png", roc_plot, width = 7, height = 5, dpi = 300)

auc_table <- tibble(
  hotspot_definition = c("Top 20%", "1.5x statewide rate"),
  auc = c(as.numeric(auc_top20), as.numeric(auc_15x))
)

write_csv(auc_table, "derived_data/auc_results.csv")