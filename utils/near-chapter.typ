#let near-chapter(with-numbering: false) = {
  let headings_after = query(selector(heading.where(level: 1)).after(here()))
  let headings_before = query(selector(heading.where(level: 1)).before(here()))
  if headings_after.len() == 0 {
    return none
  }
  let target = if headings_after.first().location().page() > here().page() {
    if headings_before.len() == 0 {
      return none
    }
    headings_before.last()
  } else {
    headings_after.first()
  }
  if with-numbering {
    let nums = counter(heading).at(target.location())
    if nums.len() == 0 {
      return (none, target.body)
    } else {
      return (nums.first(), target.body)
    }
  } else {
    return target.body
  }
}

