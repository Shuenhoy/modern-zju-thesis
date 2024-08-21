#let frontmatter(s) = {
  set page(numbering: "I")
  counter(page).update(1)
  s
}

#let mainmatter(s) = {
  set page(numbering: "1")
  s
}