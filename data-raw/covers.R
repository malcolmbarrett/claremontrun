## code to prepare `covers` dataset goes here
library(tidyverse)
library(janitor)

covers <- readxl::read_xlsx("data-raw/character_and_location_data.xlsx", sheet = 3) %>%
  clean_names() %>%
  mutate(
    characters_visualized = str_replace_all(characters_visualized, "\\*", ""),
    issue_number = str_replace_all(issue_number, "\\*", ""),
    issue_number = as.numeric(issue_number),
    cover_artist_s = str_replace_all(cover_artist_s, "\\*Uncredited on Marvel.com", "uncredited")
  ) %>%
  select(-special_notes)

names(covers) <- c("issue", "cover_artist", "narrative_captions", "characters_visualized", "characters_speaking", "dialog_text")

usethis::use_data(covers, overwrite = TRUE)
