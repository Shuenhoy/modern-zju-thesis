#import "../utils/fonts.typ": 字体, 字号
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": twoside-pagebreak

#let template-individual(
  outlined: false,
  indent-first-par: true,
  titlelevel: 2,
  titletext-settings: (size: 字号.三号, font: 字体.仿宋),
  bodytext-settings: (size: 字号.四号),
  pagetitle,
  s,
) = {
  context {
    twoside-pagebreak
    set text(font: titletext-settings.font)


    align(
      center,
      text(size: titletext-settings.size, weight: "bold")[
        #show heading: x => x.body
        #heading(pagetitle, numbering: none, level: titlelevel, outlined: outlined)
        #v(1em)],
    )

    block(width: 100%)[
      #set par(justify: true)
      #set text(..bodytext-settings)

      #s
    ]


    twoside-pagebreak
  }
}
