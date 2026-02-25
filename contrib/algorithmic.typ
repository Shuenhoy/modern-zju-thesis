#import "@preview/algorithmic:1.0.7"

#let style-algorithm(
  body,
  caption-style: strong,
  caption-align: start,
  breakable: true,
  hlines: (grid.hline(), grid.hline(), grid.hline()),
  placement: none,
  scope: "column",
) = {
  // figure is wrapped by i-figured
  show figure.where(kind: "i-figured-\"algorithm\""): it => {
    set block(breakable: breakable)
    let algo = grid(
      columns: 1,
      stroke: none,
      inset: 0% + 5pt,
      hlines.at(0),
      caption-style(align(caption-align, it.caption)),
      hlines.at(1),
      align(start, it.body),
      hlines.at(2),
    )
    let _placement = placement
    let _scope = scope
    if it.placement != none { _placement = it.placement }
    if it.scope != "column" { _scope = it.scope }
    if _placement != none {
      place(_placement, scope: _scope, float: true, algo)
    } else {
      algo
    }
  }
  body
}

#let algorithm-figure = algorithmic.algorithm-figure.with(supplement: "算法")
