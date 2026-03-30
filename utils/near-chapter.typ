#let near-chapter() = {
  let headings_after = query(selector(heading.where(level: 1)).after(here()))
  let headings_before = query(selector(heading.where(level: 1)).before(here()))
  if headings_after.len() == 0 {
    return
  } else if headings_after.first().location().page() > here().page() {
    if headings_before.len() == 0 {
      return
    }
    headings_before.last()
  } else {
    headings_after.first()
  }
}

#let numbered-near-chapter() = {
  context {
    let chapter-heading = near-chapter()
    if chapter-heading != none {
      if chapter-heading.numbering != none {
        let heading-levels = counter(heading).at(chapter-heading.location())
        let body = numbering(chapter-heading.numbering, ..heading-levels)
        [第 #body #chapter-heading.supplement #chapter-heading.body]
      } else {
        chapter-heading.body
      }
    }
  }
}
