#let show-set-supplement(s) = {
  show heading.where(level: 1): set heading(supplement: [章])
  show heading.where(level: 2): set heading(supplement: [节])
  show heading.where(level: 3): set heading(supplement: [小节])
  show heading.where(level: 4): set heading(supplement: [小小节])

  show ref: it => {
    let el = it.element
    if el == none or el.func() != heading {
      return it
    }
    let heading-levels = counter(heading).at(el.location())
    let body = numbering(el.numbering, ..heading-levels)
    link(el.location(), "第" + body + el.supplement)
  }

  s
}
