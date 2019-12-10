## code to prepare `character_visualization` dataset goes here
library(tidyverse)
library(janitor)

headers <- readxl::read_xlsx("data-raw/character_visualization_data.xlsx", sheet = 1, col_names = FALSE) %>%
  remove_empty("rows")

long_headers <- headers %>%
  t() %>%
  data.frame() %>%
  as_tibble()

long_headers_fill <- long_headers %>%
  fill(1:3) %>%
  select(X1:X28) %>%
  row_to_names(1)

names(long_headers_fill)[1:3] <- c("issue", "costume", "type")

character_visualization <-
  long_headers_fill %>%
  pivot_longer(cols = -1:-3, names_to = "character", values_to = "count") %>%
  mutate(
    type = case_when(
      type == "S" ~ "speech",
      type == "T" ~ "thought",
      type == "N" ~ "narrative",
      type == "V" ~ "depicted",
    ),
    issue = as.numeric(as.character(issue)),
    count = as.character(count),
    count = str_replace(count, "m", "0"),
    count = str_replace(count, "\\?", "0"),
    count = str_replace_all(count, "\\*", ""),
    count = str_replace_all(count, "\\(|\\)", ""),
    count = str_replace_all(count, "^IIII", "4"),
    count = str_replace_all(count, "^III", "3"),
    count = as.numeric(count),
    count = replace_na(count, 0)
  ) %>%
  pivot_wider(names_from = type, values_from = count) %>%
  arrange(issue)


usethis::use_data(character_visualization, overwrite = TRUE)
