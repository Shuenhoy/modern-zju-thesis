#import "../../utils/i-figured.typ"
#import "../../utils/supplement.typ": show-set-supplement
#import "../../utils/flex-caption.typ": show-flex-caption
#let show-caption-crossref(c) = {
  set heading(numbering: "1.1")
  show heading: i-figured.reset-counters.with(extra-kinds: ("algorithm",))

  show: show-set-supplement

  show figure: i-figured.show-figure.with(extra-prefixes: (algorithm: "alg:"))

  show math.equation.where(block: true): i-figured.show-equation
  show figure.where(kind: table): set figure.caption(position: top)

  show figure.where(kind: "algorithm"): set figure.caption(position: top)

  show: show-flex-caption
  c
}
