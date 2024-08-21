#let near-chapter = context {
  let headings_after = query(selector(heading.where(level: 1)).after(here()))
  let headings_before = query(selector(heading.where(level: 1)).before(here()))


  if headings_after.len() == 0 {
    return
  }

  let heading = headings_after.first()
  if heading.location().page() > here().page() {
    if headings_before.len() == 0 {
      return
    }
    headings_before.last().body
  } else {

    heading.body
  }
}