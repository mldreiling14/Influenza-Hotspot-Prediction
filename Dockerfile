FROM rocker/verse:latest

RUN R -e "install.packages(c( \
    'tidyverse', \
    'janitor' \
), repos='https://cran.rstudio.com/')"