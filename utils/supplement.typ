#let show-set-supplement(s) = {
  show heading.where(level: 1): set heading(supplement: [章])
  show heading.where(level: 2, numbering: "1.1"): set heading(supplement: [节])
  show heading.where(level: 3): set heading(supplement: [小节])
  show heading.where(level: 4): set heading(supplement: [小小节])
  s
}