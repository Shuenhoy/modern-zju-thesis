#import "../../utils/fonts.typ": 字体, 字号
#import "../../utils/cjk-fontstyle.typ": show-cn-fontstyle

#let show-paragraph-text(c) = {
  show: show-cn-fontstyle

  set par(leading: 0.75em, spacing: 0.75em, first-line-indent: (amount: 2em, all: true), justify: true)
  set list(indent: 2em)
  set enum(indent: 2em)

  set text(font: 字体.仿宋, size: 字号.小四, lang: "zh", discretionary-ligatures: true)
  set underline(offset: 0.2em)

  show math.equation.where(block: false): set math.frac(style: "horizontal")

  c
}
