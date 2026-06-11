library(tidyverse)
library(readxl)
library(janitor)

#=========================================================
# 1. IMPORT INFLUENZA DATA
#=========================================================

flu <- read_xlsx(
  "source_data/Influenza_Laboratory-Confirmed_Cases_by_County__Beginning_2009-10_Season_20260107.xlsx"
)

flu_clean <- flu %>%
  clean_names() %>%
  mutate(
    fips = str_pad(as.character(fips), 5, pad = "0"),
    year = as.integer(str_sub(season, 1, 4))
  ) %>%
  group_by(fips, year) %>%
  summarise(
    total_cases = sum(count, na.rm = TRUE),
    .groups = "drop"
  )

#=========================================================
# 2. IMPORT COUNTY HEALTH RANKINGS
#=========================================================

read_chr_year <- function(year) {
  
  filepath <- paste0(
    "source_data/analytic_data",
    year,
    ".csv"
  )
  
  read_csv(filepath, show_col_types = FALSE) %>%
    mutate(year = year)
  
}

years <- 2010:2025

chr_all <- map_dfr(years, read_chr_year) %>%
  clean_names()

ny_chr <- chr_all %>%
  filter(state_abbreviation == "NY") %>%
  mutate(
    fips = str_pad(
      as.character(x5_digit_fips_code),
      5,
      pad = "0"
    )
  )

#=========================================================
# 3. JOIN FLU + CHR
#=========================================================

analysis_data <- flu_clean %>%
  inner_join(
    ny_chr,
    by = c("fips", "year")
  )

#=========================================================
# 4. IMPORT WEATHER DATA
#=========================================================

weather <- read_csv(
  "source_data/weather_data.csv",
  show_col_types = FALSE
) %>%
  clean_names()

seasonal_weather <- read_csv(
  "source_data/seasonal_weather.csv",
  show_col_types = FALSE
) %>%
  clean_names()

weather <- weather %>%
  mutate(
    county = county %>%
      str_remove(" County$") %>%
      str_to_upper()
  )

county_lookup <- weather %>%
  transmute(
    county,
    weather_lat = latitude,
    weather_lon = longitude
  ) %>%
  distinct()

seasonal_with_county <- seasonal_weather %>%
  mutate(row_id = row_number()) %>%
  crossing(county_lookup) %>%
  mutate(
    coord_dist =
      sqrt(
        (latitude - weather_lat)^2 +
          (longitude - weather_lon)^2
      )
  ) %>%
  group_by(row_id) %>%
  slice_min(
    coord_dist,
    n = 1,
    with_ties = FALSE
  ) %>%
  ungroup() %>%
  dplyr::select(
    county,
    flu_season,
    mean_temp_f,
    mean_temp_c,
    mean_humidity_percent,
    days_observed
  )

analysis_data <- analysis_data %>%
  mutate(
    county = name %>%
      str_remove(" County$") %>%
      str_to_upper()
  ) %>%
  left_join(
    seasonal_with_county,
    by = c(
      "county",
      "year" = "flu_season"
    )
  )

#=========================================================
# 5. IMPORT GDP DATA
#=========================================================

gdp <- read_csv(
  "source_data/NY_GDP_Data.csv",
  skip = 3,
  show_col_types = FALSE
)

gdp_long <- gdp %>%
  pivot_longer(
    cols = matches("^20"),
    names_to = "year",
    values_to = "GDP"
  ) %>%
  mutate(
    year = as.integer(year),
    
    fips = str_pad(
      str_extract(
        GeoFIPS,
        "\\d+"
      ),
      5,
      pad = "0"
    )
  ) %>%
  dplyr::select(
    fips,
    year,
    GDP
  )

analysis_data <- analysis_data %>%
  left_join(
    gdp_long,
    by = c(
      "fips",
      "year"
    )
  )

#=========================================================
# 6. REMOVE ADMINISTRATIVE VARIABLES
#=========================================================

analysis_data <- analysis_data %>%
  dplyr::select(
    -any_of(
      c(
        "x5_digit_fips_code",
        "state_abbreviation",
        "state_fips_code",
        "county_fips_code",
        "county_ranked_yes_1_no_0",
        "geography",
        "geoname",
        "program_type",
        "release_year"
      )
    )
  )

#=========================================================
# 7. MISSINGNESS SUMMARY
#=========================================================

missing_summary <- tibble(
  variable = names(analysis_data),
  n_missing = colSums(is.na(analysis_data)),
  pct_missing =
    colMeans(is.na(analysis_data)) * 100
)

write_csv(
  missing_summary,
  "derived_data/missing_data_summary.csv"
)

#=========================================================
# 8. SAVE FINAL DATASET
#=========================================================

write_csv(
  analysis_data,
  "derived_data/final_analysis_dataset.csv"
)

#=========================================================
# 8. CLEAN AND SAVE FINAL DATASET
#=========================================================
data <- read_csv("derived_data/final_analysis_dataset.csv", show_col_types = FALSE) |>
  clean_names()

data_clean <- data |>
  dplyr::select(
    -contains("numerator"),
    -contains("denominator"),
    -contains("ci_low"),
    -contains("ci_high"),
    -contains("flag")
  )

missing_summary <- tibble(
  variable = names(data_clean),
  n_missing = colSums(is.na(data_clean)),
  pct_missing = colMeans(is.na(data_clean)) * 100
) |>
  arrange(desc(pct_missing))

write_csv(missing_summary, "derived_data/missing_data_summary.csv")
write_csv(data_clean, "derived_data/analysis_data_clean.csv")
