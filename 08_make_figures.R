library(tidyverse)

dir.create("figures", showWarnings = FALSE)

data <- read_csv("derived_data/hotspot_results.csv", show_col_types = FALSE)

observed_predicted_plot <- ggplot(
  data,
  aes(x = actual_rate, y = predicted_rate)
) +
  geom_point(alpha = 0.7) +
  geom_abline(linetype = "dashed", color = "gray50") +
  labs(
    title = "Observed vs Predicted Influenza Rates",
    x = "Observed cases per 100,000",
    y = "Predicted cases per 100,000"
  ) +
  theme_minimal(base_size = 13)

ggsave(
  "figures/observed_vs_predicted.png",
  observed_predicted_plot,
  width = 7,
  height = 5,
  dpi = 300
)

top_county_plot <- data |>
  arrange(desc(predicted_rate)) |>
  slice_head(n = 15) |>
  ggplot(
    aes(x = reorder(county, predicted_rate), y = predicted_rate)
  ) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top Predicted Influenza Hotspot Counties",
     x = "County",
    y = "Predicted cases per 100,000"
  ) +
  theme_minimal(base_size = 13)

ggsave(
  "figures/top_predicted_hotspot_counties.png",
  top_county_plot,
  width = 7,
  height = 6,
  dpi = 300
)