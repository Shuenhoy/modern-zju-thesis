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

