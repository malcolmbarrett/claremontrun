#' Whether or not an issue of Uncanny X-Men met the Bechdel test
#'
#' `xmen_bechdel` is a `tibble` that that contains data on whether or not the
#' issue satisfied the Bechdel test: 1) more than one female character 2) who
#' have a conversation with each other  3) about something other than men.
#' `xmen_bechdel` has Bechdel data on issues 1 through 534. Note that issues 67
#' through 93 were reprints of previous issues, which occurred prior to the
#' Claremont run. See also [`comic_bechdel`], which contains Bechdel data on
#' other (non-X-Men) iconic runs of Marvel comicbooks.
#'
#' @format A `tibble` with 545 rows and 4 variables: `issue`, the issue number,
#'   `pass_bechdel`, whether or not the issue passed the Bechdel test, `notes`,
#'   notes by the Claremont project team regarding the issue, and `reprint`,
#'   whether or not the issue was a reprint of a previous issue.
#'
"xmen_bechdel"

#' Whether or not an issue of another comic series met the Bechdel test
#'
#' `comic_bechdel` is a `tibble` that contains data on other (non-X-Men) iconic
#' runs of Marvel comicbooks, and whether these titles passed the Bechdel test:
#' 1) more than one female character 2) who have a conversation with each other
#' 3) about something other than men. `comic_bechdel`  has data on iconic runs
#' from . See also [`xmen_bechdel`], which contains Bechdel data on Uncanny
#' X-Men issues 1-534.
#'
#' @format A `tibble` with 308 rows and 9 variables: `series`, the series title,
#'   `issue`, the issue number, `title`, the title of the issue, `writer`,
#'   `artist`, `cover_artist`, `pass_bechdel`, whether or not the issue passed
#'   the Bechdel test, `page_number`, the page number(s) where the issue passed
#'   the Bechdel test, and `notes`, notes by the Claremont project team
#'   regarding the issue. done.
#'
"comic_bechdel"

