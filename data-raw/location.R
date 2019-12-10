## code to prepare `location` dataset goes here
library(tidyverse)
library(janitor)

locations <- readxl::read_xlsx("data-raw/character_and_location_data.xlsx", sheet = 2) %>%
  select(-5)

names(locations) <- c("issue", "location", "context", "notes")
locations <- locations %>%
  remove_empty("rows") %>%
  fill(issue)

usethis::use_data(location, overwrite = TRUE)
