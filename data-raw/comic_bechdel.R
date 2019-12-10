## code to prepare `comic_bechdel` dataset goes here
library(tidyverse)

clean_bechdel_data <- function(.df) {
  if (ncol(.df) == 7) .df$notes <- NA_character_
  names(.df) <- c("series_issue", "title", "writer", "artist", "cover_artist", "pass_bechdel", "page_number", "notes")

  .df <- .df %>%
    mutate_at(vars(series_issue, page_number, pass_bechdel), ~str_replace_all(., "\\*", "")) %>%
    mutate(
      pass_bechdel = str_replace_all(pass_bechdel, "Yes\\?", "Yes"),
      pass_bechdel = str_replace_all(pass_bechdel, "\\?", "Maybe"),
      pass_bechdel = case_when(
        pass_bechdel == "Yes" ~ "yes",
        pass_bechdel == "No" ~ "no",
        TRUE ~ NA_character_,
      )
    ) %>%
    separate(series_issue, into = c("series", "issue"), sep = " #", convert = TRUE)

  .df
}

sheets <- readxl::excel_sheets("data-raw/bechdel_test_comparators.xlsx")
comic_bechdel <- map(sheets, ~readxl::read_xlsx("data-raw/bechdel_test_comparators.xlsx", sheet = .x, na = c("", "N/A"))) %>%
  map(clean_bechdel_data) %>%
  bind_rows() %>%
  filter(!is.na(series))

usethis::use_data(comic_bechdel, overwrite = TRUE)
