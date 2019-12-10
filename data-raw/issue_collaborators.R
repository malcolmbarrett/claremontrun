## code to prepare `issue_collaborators` dataset goes here

pencillers <- bind_rows(
  tibble(
    penciller = "John Byrne",
    issue = c(108:109, 111:142)
  ),
  tibble(
    penciller = "Dave Cockrum",
    issue = c(97:105, 107, 145:164)
  ),
  tibble(
    penciller = "Paul Smith",
    issue = c(165:170, 172:175, 278)
  ),
  tibble(
    penciller = "John Romita Jr.",
    issue = c(175:185, 187:197, 199:200, 202:203, 206:211)
  ),
  tibble(
    penciller = "Marc Silvestri",
    issue = c(218, 220:222, 224:227, 229:230, 232:234, 236, 238:244, 246:247, 249:251, 253:255, 259:261)
  ),
  tibble(
    penciller = "Jim Lee",
    issue = c(248, 256:258, 267:277)
  )
) %>%
  arrange(issue)

editors_in_chief <- bind_rows(
  tibble(
    editor_in_chief = "Marv Wolfman",
    issue = c(97:100)
  ),
  tibble(
    editor_in_chief = "Archie Goodwin",
    issue = c(101:111)
  ),
  tibble(
    editor_in_chief = "Jim Shooter",
    issue = c(112:222)
  ),
  tibble(
    editor_in_chief = "Tom Defalco",
    issue = c(223:279)
  )
) %>%
  arrange(issue)

editors <- bind_rows(
  tibble(
    editor = "Marv Wolfman",
    issue = c(113:131)
  ),
  tibble(
    editor = "Archie Goodwin",
    issue = c(132:137)
  ),
  tibble(
    editor = "Jim Shooter",
    issue = c(137:182)
  ),
  tibble(
    editor = "Tom Defalco",
    issue = c(179:232)
  ),
  tibble(
    editor = "Tom Defalco",
    issue = c(232:279)
  )
) %>%
  arrange(issue)

issue_collaborators <- editors_in_chief %>%
  full_join(editors, by = "issue") %>%
  full_join(pencillers, by = "issue") %>%
  select(issue, everything())

usethis::use_data(issue_collaborators, overwrite = TRUE)
