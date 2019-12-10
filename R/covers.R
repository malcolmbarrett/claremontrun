#' Whether or not an issue of Uncanny X-Men met the Bechdel test
#'
#' `covers` is a `tibble` that that contains data on the covers of the issues
#' that occurred during the Claremont run. This includes the artist, any text on
#' the cover, the characters visualized, and who is speaking.
#'
#' @format A `tibble` with 184 rows and 6 variables: `issue`, the issue number,
#'   `cover_artist`, the artist of the cover, `narrative_captions`, non-dialogue
#'   text included on the cover, `characters_visualized`, the characters shown
#'   on the cover, `characters_speaking`, who is speaking on the cover, and
#'   `dialog_test`, text being spoken by a character.
#'
"covers"
