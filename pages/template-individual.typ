#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display


#let template-individual(
  twoside: false,
  outlined: false,
  titlelevel: 2,
  pagetitle,
  s,
) = {

  context {
    pagebreak(
      weak: true,
      to: if twoside {
        "odd"
      },
    )
    set text(font: 字体.仿宋)


    align(
      center,
      text(size: 字号.三号, weight: "bold")[
        #show heading: x => x.body
        #heading(pagetitle, numbering: none, level: titlelevel, outlined: outlined)
        #v(1em)],
    )

    block(width: 100%)[
      #set par(justify: true)
      #set text(size: 字号.四号)
      #s
    ]



  }
}