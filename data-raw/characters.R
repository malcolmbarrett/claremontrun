## code to prepare `characters` dataset goes here
library(tidyverse)
library(janitor)

characters <- readxl::read_xlsx("data-raw/character_and_location_data.xlsx", sheet = 1) %>%
  clean_names() %>%
  rename(issue = issue_number)

count_vars <- vars(
  rendered_unconcious:number_of_kills_non_humans,
  shower_number_of_panels_shower_lasts:visible_tears_number_of_intances
)

characters <- characters %>%
  remove_empty("rows") %>%
  fill(issue) %>%
  mutate_at(count_vars, ~replace_na(., 0)) %>%
  mutate_at(count_vars, ~str_replace_all(., "\\*", "")) %>%
  mutate_at(count_vars, ~str_replace_all(., "\\!", "1")) %>%
  mutate_at(count_vars, ~str_replace_all(., "1 \\+ 1", "2")) %>%
  mutate(depicted_eating_food = str_replace_all(depicted_eating_food, "Forge|X-Men", "1")) %>%
  mutate_at(count_vars, ~as.numeric(.))

usethis::use_data(characters, overwrite = TRUE)
