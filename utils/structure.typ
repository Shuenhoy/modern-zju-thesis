#let abstractmatter(s) = {
  set page(numbering: "i")
  counter(page).update(1)
  s
}

#let frontmatter(s) = {
  set page(numbering: "I")
  counter(page).update(1)
  s
}

#let mainmatter(s) = {
  set page(numbering: "1")
  set par(spacing: 1.3em)
  counter(page).update(1)
  s
}
