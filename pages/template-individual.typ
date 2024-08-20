#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": twoside-pagebreak

#let template-individual(
  outlined: false,
  titlelevel: 2,
  pagetitle,
  s,
) = {

  context {
    twoside-pagebreak
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