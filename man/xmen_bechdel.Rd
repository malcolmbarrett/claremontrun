% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bechdel.R
\docType{data}
\name{xmen_bechdel}
\alias{xmen_bechdel}
\title{Whether or not an issue of Uncanny X-Men met the Bechdel test}
\format{A `tibble` with 545 rows and 4 variables: `issue`, the issue number,
  `pass_bechdel`, whether or not the issue passed the Bechdel test, `notes`,
  notes by the Claremont project team regarding the issue, and `reprint`,
  whether or not the issue was a reprint of a previous issue.}
\usage{
xmen_bechdel
}
\description{
`xmen_bechdel` is a `tibble` that that contains data on whether or not the
issue satisfied the Bechdel test: 1) more than one female character 2) who
have a conversation with each other  3) about something other than men.
`xmen_bechdel` has Bechdel data on issues 1 through 534. Note that issues 67
through 93 were reprints of previous issues, which occurred prior to the
Claremont run. See also [`comic_bechdel`], which contains Bechdel data on
other (non-X-Men) iconic runs of Marvel comicbooks.
}
\keyword{datasets}
