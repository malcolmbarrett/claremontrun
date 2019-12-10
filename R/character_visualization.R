#' Counts of character speech, thought, narrative, or visual depictions in the
#' Claremont run
#'
#' `character_visualization` is a `tibble` that contains data on the
#' character visualizations during the Claremont run by issue and whether they
#' were costumed: a count of how many times the character spoke, thought,
#' narrated, or were visually depicted.
#'
#' @format A `tibble` with 9,800 rows and 7 variables: `issue`, the issue
#'   number, `costume`, whether not the character was wearing a costume,
#'   `character`, `speech`, `thought`, `narrative`, and `depicted`. The last
#'   four are counts of how many times the character spoke, thought, narrated,
#'   or were visually depicted. Each issue has data on each character by whether
#'   or not they wore a costume.
#'
"character_visualization"

