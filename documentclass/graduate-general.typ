#import "../pages/graduate-cover.typ": graduate-cover
#import "../pages/graduate-title-zh.typ": graduate-title-zh
#import "../pages/graduate-title-en.typ": graduate-title-en
#import "../pages/graduate-decl.typ": graduate-decl


#import "../pages/template-individual.typ": template-individual
#import "../pages/outline.typ": main-outline



#import "../utils/fonts.typ": *
#import "../utils/appendix.typ": *
#import "../utils/header.typ": header, footer
#import "../utils/fakebold.typ": *
#import "../utils/indent-first-par.typ": *
#import "../utils/supplement.typ": *
#import "../utils/twoside.typ": *

#import "@preview/i-figured:0.2.4"

#let show-outline-indent(s) = {

  show outline.entry: it => {

    if it.level == 1 {
      text(weight: "bold", it)
    } else {
      h(1em * (it.level - 1)) + it
    }
  }
  s
}

#let default-info = (
  title: ("毕业论文/设计题目", ""),
  title-en: ("Graduation Project/Design Title", ""),
  grade: "20XX",
  student-id: "1234567890",
  clc: "O643.12",
  unitcode: "10335",
  reviewer: ("隐名", "隐名", "隐名", "隐名", "隐名"),
  committe: ("主席", "委员", "委员", "委员", "委员", "委员"),
  reviewer-en: ("Anonymous", "Anonymous", "Anonymous", "Anonymous", "Anonymous"),
  committe-en: ("Chair", "Committeeman", "Committeeman", "Committeeman", "Committeeman", "Committeeman"),
  secret-level: "无",
  author: "张三",
  department: "某学院",
  major: "某专业",
  degree: "硕士",
  field: "某方向",
  supervisor: "李四",
  submit-date: datetime.today(),
  defense-date: ("二一九三年六月", "September 2193"),
)

#let graduate-general-set-style(doc, degree: "硕士") = {
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
      left: [浙江大学#(degree)学位论文],
      right: context {
        let headings_after = query(selector(heading.where(level: 1)).after(here()))
        let headings_before = query(selector(heading.where(level: 1)).before(here()))


        if headings_after.len() == 0 {
          return
        }

        let heading = headings_after.first()
        if heading.location().page() > here().page() {
          if headings_before.len() == 0 {
            return
          }
          headings_before.last().body
        } else {

          heading.body
        }
      },
    ),
    footer: footer(center: numbering => numbering),
  )
  set par(leading: 1.3em, first-line-indent: 2em)


  set heading(numbering: "1.1")

  show heading.where(level: 1): set text(size: 字号.小三)
  show heading.where(level: 1): x => {
    twoside-pagebreak
    v(12pt)
    x
    v(6pt)
  }
  show heading.where(level: 2): set text(size: 字号.四号)
  show heading.where(level: 3): set text(size: 字号.四号)
  show heading.where(level: 4): set text(size: 字号.四号)
  show heading: set block(above: 1.5em, below: 1.5em)
  show: indent-first-par
  show heading: i-figured.reset-counters
  show: show-set-supplement

  show figure: i-figured.show-figure
  show: show-cn-fakebold
  show: show-outline-indent
  show math.equation.where(block: true): i-figured.show-equation
  set underline(offset: 0.2em)
  show figure.where(kind: table): set figure.caption(position: top)


  set text(font: 字体.仿宋, size: 字号.小四, lang: "zh")


  doc
}


#let graduate-general(config, twoside: false) = {
  let info = default-info + config.info
  (
    pages: (
      cover: graduate-cover(info: info),
      title-zh: graduate-title-zh(info: info),
      title-en: graduate-title-en(info: info),
      decl: graduate-decl(),
      outline: main-outline(outlined: true, titlelevel: 1),
      individual: template-individual.with(outlined: true, titlelevel: 1),
    ),
    style: doc => {
      set document(title: info.title.join())
      show: graduate-general-set-style.with(degree: info.degree)
      show: show-twoside-pagebreak.with(twoside: twoside)

      doc
    },
  )
}
