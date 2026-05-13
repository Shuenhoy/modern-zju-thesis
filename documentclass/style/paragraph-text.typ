#import "../../utils/fonts.typ": 字体, 字号
#import "../../utils/cjk-fontstyle.typ": show-cn-fontstyle
#import "../../utils/global-options.typ": experimental-parize

#import "@preview/parize:0.1.0": par-indent

#let show-paragraph-text(c) = {
  show: show-cn-fontstyle

  show: it => {
    if experimental-parize {
      show: par-indent
      it
    } else {
      it
    }
  }
  set list(indent: 2em)
  set enum(indent: 2em)

  set text(font: 字体.仿宋, size: 字号.小四, lang: "zh", discretionary-ligatures: true)
  set underline(offset: 0.2em)
  show figure: set block(spacing: 2em)
  show math.equation.where(block: true): set block(inset: (top: 0.5em, bottom: 0.5em), sticky: true)
  show math.equation.where(block: false): set math.frac(style: "horizontal")
  c
}
