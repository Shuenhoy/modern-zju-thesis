// Source from: https://github.com/nju-lug/modern-nju-thesis

#let empty-par = par[#box()]
#let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)
#let indent-first-par(s) = {
  let indent-next-par(s) = {
    s
    fake-par
  }
  show heading: indent-next-par
  show list: indent-next-par
  show enum: indent-next-par
  show figure: indent-next-par
  show math.equation.where(block: true): indent-next-par
  s
}