#import "../utils/fonts.typ": 字号, 字体
#import "../utils/part.typ": *
#import "../utils/header.typ": header, footer
#import "@preview/i-figured:0.2.4"

#let bachelor-cs-set-style(doc) = {
  set page(
    paper: "a4",
    margin: (
      x: 3.18cm,
      bottom: 2.54cm + 12pt + 30pt,
      top: 2.54cm + 12pt + 4mm,
    ),
    header-ascent: 4mm,
    footer-descent: 35pt,
    header: header(
      left: locate(loc => if not calc.even(loc.page()) {
        "浙江大学本科生毕业论文"
      }),
      right: locate(loc => if calc.even(loc.page()) {
        document.title
      }),
    ),
    footer: footer(center: numbering => numbering),
  )
  set par(leading: 1.3em)


  set heading(numbering: (..numbers) => {
    let level = numbers.pos().len()
    if (level == 1) {
      return numbering("一、", numbers.pos().at(level - 1))
    } else {
      return numbering("1.1  ", ..numbers.pos().slice(1))
    }
  })
  show heading.where(level: 1): x => {
    pagebreak()
    v(12pt)
    align(center, x)
    v(6pt)
  }

  show heading.where(level: 2): set text(size: 字号.三号)
  show heading.where(level: 3): set text(size: 字号.小三)
  show heading.where(level: 4): set text(size: 字号.四号)
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure

  show: show-part
  show: show-outline
  show math.equation.where(block: true): i-figured.show-equation


  set text(font: 字体.仿宋, size: 字号.小四)
  doc
}