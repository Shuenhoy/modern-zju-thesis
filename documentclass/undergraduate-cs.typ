#import "../pages/undergraduate-cs-cover.typ": undergraduate-cover
#import "../pages/undergraduate-promise.typ": undergraduate-promise
#import "../pages/template-individual.typ": template-individual
#import "../pages/outline.typ": main-outline
#import "../pages/undergraduate-task.typ": undergraduate-task
#import "../pages/undergraduate-eval.typ": undergraduate-eval
#import "../pages/undergraduate-proposal-eval.typ": undergraduate-proposal-eval


#import "../utils/part.typ": *
#import "../utils/fonts.typ": *
#import "../utils/appendix.typ": *

#import "../utils/fonts.typ": 字号, 字体
#import "../utils/part.typ": *
#import "../utils/header.typ": header, footer
#import "../utils/fakebold.typ": *
#import "../utils/indent-first-par.typ": *
#import "../utils/supplement.typ": *
#import "../utils/twoside.typ": *


#import "@preview/i-figured:0.2.4"


#let undergraduate-cs-set-style(doc) = {
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
    footer: twoside-numbering-footer,
  )
  set par(leading: 1.3em, first-line-indent: 2em)


  set heading(numbering: (..numbers) => {
    let level = numbers.pos().len()
    if (level == 1) {
      return numbering("一、", numbers.pos().at(level - 1))
    } else {
      return numbering("1.1  ", ..numbers.pos().slice(1))
    }
  })
  show heading.where(level: 1): x => {
    twoside-pagebreak
    v(12pt)
    align(center, x)
    v(6pt)
  }

  show heading.where(level: 2): set text(size: 字号.三号)
  show heading.where(level: 3): set text(size: 字号.小三)
  show heading.where(level: 4): set text(size: 字号.四号)
  show: indent-first-par
  show heading: i-figured.reset-counters
  show: show-set-supplement

  show figure: i-figured.show-figure
  show: show-cn-fakebold
  show: show-part
  show: show-outline-with-part
  show math.equation.where(block: true): i-figured.show-equation
  set underline(offset: 0.2em)
  show figure.where(kind: table): set figure.caption(position: top)


  set text(font: 字体.仿宋, size: 字号.小四, lang: "zh")
  doc
}

#let undergraduate-cs-default-info = (
  title: ("毕业论文/设计题目",),
  grade: "20XX",
  student-id: "1234567890",
  author: "张三",
  author-en: "Zhang San",
  department: "某学院",
  major: "某专业",
  field: "某方向",
  supervisor: "李四",
  submit-date: datetime.today(),
)

#let undergraduate-cs(info: undergraduate-cs-default-info, twoside: true) = {
  (
    pages: (
      cover: undergraduate-cover(info: info),
      promise: undergraduate-promise(),
      outline: main-outline(target: chapters-and-headings),
      task: undergraduate-task(),
      individual: template-individual,
      eval: undergraduate-eval,
      proposal-eval: undergraduate-proposal-eval(),
    ),
    style: doc => {
      set document(title: info.title.join())
      show: undergraduate-cs-set-style
      show: show-twoside-pagebreak.with(twoside: twoside)
      doc
    },
  )
}
