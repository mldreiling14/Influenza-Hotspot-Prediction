required_packages <- c(
  "broom",
  "car",
  "janitor",
  "MASS",
  "pROC",
  "readxl",
  "tidyverse"
)

cran_repo <- "https://cloud.r-project.org"

installed_packages <- rownames(installed.packages())
missing_packages <- setdiff(required_packages, installed_packages)

if (length(missing_packages) == 0) {
  message("All required R packages are already installed.")
} else {
  message(
    "Installing missing R packages: ",
    paste(missing_packages, collapse = ", ")
  )

  install.packages(
    missing_packages,
    repos = cran_repo,
    dependencies = TRUE
  )
}

