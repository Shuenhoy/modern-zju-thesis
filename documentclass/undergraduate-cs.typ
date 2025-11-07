#import "../pages/undergraduate-cover.typ": undergraduate-cover
#import "../pages/undergraduate-decl.typ": undergraduate-decl
#import "../pages/template-individual.typ": template-individual
#import "../pages/outline.typ": main-outline
#import "../pages/bibliography.typ": bibliography-page
#import "../pages/undergraduate-task.typ": undergraduate-task
#import "../pages/undergraduate-eval.typ": undergraduate-eval
#import "../pages/undergraduate-proposal-cover.typ": undergraduate-proposal-cover
#import "../pages/undergraduate-proposal-task.typ": undergraduate-proposal-task
#import "../pages/undergraduate-proposal-eval.typ": undergraduate-proposal-eval

#import "../utils/fonts.typ": *
#import "../utils/part.typ": part, part-and-headings, part-bib, show-outline-with-part, show-part
#import "../utils/bib-provider.typ": bib-provider
#import "../utils/header.typ": footer, header
#import "../utils/fakebold.typ": show-cn-fakebold
#import "../utils/supplement.typ": show-set-supplement
#import "../utils/twoside.typ": show-twoside-pagebreak, twoside-numbering-footer, twoside-pagebreak
#import "../utils/structure.typ": frontmatter, mainmatter
#import "../utils/appendix.typ": appendix

#import "../dependency/i-figured.typ"


#let undergraduate-cs-set-style(doc, twoside: true, bibmode: "part") = {
  // Page geometry
  set page(
    paper: "a4",
    margin: (
      x: 3.18cm,
      bottom: 2.54cm + 12pt + 30pt,
      top: 2.54cm + 12pt + 4mm,
    ),
  )
  show: show-twoside-pagebreak.with(twoside: twoside)

  // Header and footer
  set page(
    header-ascent: 4mm,
    footer-descent: 35pt,
    header: header(
      left: context {
        if not calc.even(here().page()) {
          "浙江大学本科生毕业论文"
        }
      },
      right: context {
        if calc.even(here().page()) {
          document.title
        }
      },
    ),
    footer: twoside-numbering-footer,
  )

  // Paragraph and text
  set par(leading: 1.3em, first-line-indent: (amount: 2em, all: true), justify: true)
  set text(font: 字体.仿宋, size: 字号.小四, lang: "zh", discretionary-ligatures: true)
  show: show-cn-fakebold
  set underline(offset: 0.2em)


  // Headings
  show heading: i-figured.reset-counters

  set heading(
    numbering: (..numbers) => {
      let level = numbers.pos().len()
      return numbering("1.1  ", ..numbers.pos())
    },
  )
  show heading.where(level: 1): x => {
    twoside-pagebreak
    v(12pt)
    x
    v(6pt)
  }

  show heading.where(level: 2): set text(size: 字号.小三)
  show heading.where(level: 3): set text(size: 字号.四号)
  show heading.where(level: 4): set text(size: 字号.四号)
  show heading: set block(above: 1.5em, below: 1.5em)


  // Reference
  show: show-set-supplement
  show figure: i-figured.show-figure
  show math.equation.where(block: true): i-figured.show-equation
  show figure.where(kind: table): set figure.caption(position: top)

  // Part
  show: show-part.with(enable-ref: bibmode == "partbib")
  show: show-outline-with-part


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

#let undergraduate-cs(
  info: (:),
  twoside: true,
  bibsource: "",
  bibmode: "citext",
) = {
  assert(bibmode == "citext" or bibmode == "partbib")

  let info = undergraduate-cs-default-info + info
  let bib = bib-provider(bibsource, mode: bibmode, options: (row-gutter: 0.5em))

  let bibcontent = [
    #set par(leading: 0.55em)
    #set text(size: 字号.小四, font: 字体.宋体)
    #bib.bibcontent
  ]

  (
    pages: (
      cover: undergraduate-cover(info: info),
      decl: undergraduate-decl(),
      outline: main-outline(target: part-and-headings),
      task: undergraduate-task.with(info: info),
      individual: template-individual,
      eval: undergraduate-eval,
      bibliography: bibliography-page(bib: bibcontent, individual: template-individual),
      proposal-cover: undergraduate-proposal-cover(info: info),
      proposal-task: undergraduate-proposal-task.with(info: info),
      proposal-eval: undergraduate-proposal-eval,
    ),
    components: (
      bibliography: [
        #bib.bibcontent],
      new-bib: bib.new-bib,
    ),
    style: doc => {
      set document(title: info.title.join())

      let doc = undergraduate-cs-set-style(doc, twoside: twoside, bibmode: bibmode)
      show: bib.bibshow

      bib.hiddenbib + doc
    },
  )
}
