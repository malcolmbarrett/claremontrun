## code to prepare `xmen_bechdel` dataset goes here

library(tidyverse)

xmen_bechdel <- readxl::read_xlsx("data-raw/xmen_Bechdel_test.xlsx", sheet = 1) %>%
  select(1:3)

names(xmen_bechdel) <- c("issue", "pass_bechdel", "notes")

xmen_bechdel <- xmen_bechdel %>%
  mutate_if(is.character, ~str_replace_all(., "\\*", "")) %>%
  mutate(
    pass_bechdel = case_when(
      pass_bechdel == "Y" ~ "yes",
      pass_bechdel == "N" ~ "no",
      TRUE ~ NA_character_,
    )
  )

reprints <- tibble(
  issue = c(12, 14, 16, 17, 20:21, 25:45),
  reprint_issue = 67:93
)

reprints <- reprints %>%
  left_join(xmen_bechdel, by = "issue") %>%
  select(issue = reprint_issue, pass_bechdel, notes) %>%
  mutate(reprint = TRUE)

xmen_bechdel <- xmen_bechdel %>%
  filter(!between(issue, 67, 93)) %>%
  mutate(reprint = FALSE) %>%
  bind_rows(reprints) %>%
  arrange(issue)

usethis::use_data(xmen_bechdel, overwrite = TRUE)
