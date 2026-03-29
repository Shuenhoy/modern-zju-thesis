#import "../dependency/i-figured.typ"

#let appendix(level: 2, body) = {
  counter(heading).update(0)
  show metadata.where(value: <mzt:twoside-pagebreak>): none
  let apn = (..numbers, style: "A.1") => {
    let clevel = numbers.pos().len()
    if (clevel <= level) {
      return none
    } else {
      return numbering(style, ..numbers.pos().slice(level))
    }
  }
  show heading: set heading(
    numbering: apn,
    supplement: [附录],
  )
  show heading: i-figured.reset-counters.with(extra-kinds: ("algorithm",), level: 2)

  show figure: i-figured.show-figure.with(extra-prefixes: (algorithm: "alg:"), numbering: apn, level: 2)
  show math.equation.where(block: true): i-figured.show-equation.with(numbering: apn.with(style: "(A.1)"), level: 2)
  body
}
