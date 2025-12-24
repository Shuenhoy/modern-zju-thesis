#import "../pages/graduate-cover.typ": graduate-cover
#import "../pages/graduate-title-zh.typ": graduate-title-zh
#import "../pages/graduate-title-en.typ": graduate-title-en
#import "../pages/graduate-decl.typ": graduate-decl
#import "../pages/bibliography.typ": bibliography-page
#import "../pages/template-individual.typ": template-individual
#import "../pages/outline.typ": figure-outline, main-outline, table-outline

#import "../utils/fonts.typ": *
#import "../utils/header.typ": footer, header
#import "../utils/fakebold.typ": show-cn-fakebold
#import "../utils/supplement.typ": show-set-supplement
#import "../utils/twoside.typ": show-twoside-pagebreak, twoside-numbering-footer, twoside-pagebreak
#import "../utils/near-chapter.typ": near-chapter
#import "../utils/appendix.typ": appendix
#import "../utils/bib-provider.typ": bib-provider
#import "../utils/flex-caption.typ": show-flex-caption

#import "../dependency/i-figured.typ"

#let abstractmatter(s) = {
  set page(numbering: "i")
  set par(spacing: 11pt)
  counter(page).update(1)
  s
}

#let frontmatter(s) = {
  set page(numbering: "I")
  counter(page).update(1)
  s
}

#let mainmatter(s) = {
  set page(numbering: "1")
  set par(spacing: 11pt)
  counter(page).update(1)
  s
}

#let show-outline(s) = {
  show outline.entry.where(level: 1): it => {
    let h = it.element
    let toc-page = here().page()

    // hide caption for non-numbered headings
    if h.numbering == none {
      return it
    }

    let nums = counter(heading).at(h.location())
    let chap = nums.first()

    link(
      h.location(),
      it.indented(
        [第 #chap 章],
        it.inner(),
      ),
    )
  }
  s
}

#let graduate-st-default-info = (
  title: ("小二号仿宋字体 加粗", ""),
  title-en: ("小二号 Times New Roman 字体 加粗", ""),
  grade: "20XX",
  student-id: "1234567890",
  clc: "TP311.5",
  unitcode: "10335",
  reviewer: ("姓名、职称、单位，下同", "隐名评阅学位论文省略", "", "", ""),
  committe: ("姓名、职称、单位", "", "", "", "", ""),
  reviewer-en: ("姓名、职称、单位，下同", "隐名评阅学位论文省略", "", "", ""),
  committe-en: ("姓名、职称、单位", "", "", "", "", ""),
  secret-level: "无",
  author: "张三",
  department: "某学院",
  major: "某专业",
  degree: "硕士",
  field: "某方向",
  supervisor: "李四",
  co-supervisor: "李四",
  submit-date: datetime.today(),
  defense-date: ("二一九三年六月", "September 2193"),
)

#let graduate-st-set-style(doc, degree, twoside) = {
  // Page geometry
  set page(
    paper: "a4",
    margin: (
      x: 3.2cm,
      y: 3.8cm,
    ),
  )
  show: show-twoside-pagebreak.with(twoside: twoside)

  // Header and footer
  set page(
    numbering: "1",
    header-ascent: 0.8cm,
    footer-descent: 0.8cm,
    header: header(
      left: [浙江大学#(degree)学位论文],
      right: context {
        let chapter-heading = near-chapter()
        if chapter-heading != none {
          if chapter-heading.numbering != none {
            [第 #counter(heading).at(chapter-heading.location()).first() 章 #chapter-heading.body]
          } else {
            chapter-heading.body
          }
        }
      },
    ),
    footer: twoside-numbering-footer,
  )


  // Paragraph and text
  set par(leading: 11pt, first-line-indent: (amount: 2em, all: true), justify: true)
  set text(font: 字体.仿宋, size: 字号.小四, lang: "zh", discretionary-ligatures: true)
  set text(costs: (widow: 0%, orphan: 0%))
  show: show-cn-fakebold
  set underline(offset: 0.2em)

  // Headings
  show heading.where(level: 1): it => {
    let chap-num = context {
      counter(heading).display("1")
    }
    twoside-pagebreak
    align(
      center,
    )[
      #block(below: 1.5em)[
        #text(size: 字号.小二, weight: "bold")[
          第 #chap-num 章 #it.body
        ]]
    ]
  }
  set heading(numbering: "1.1")
  // 图 1.1, 2.1 for each subsection
  show heading: i-figured.reset-counters
  show heading.where(level: 2): set text(size: 字号.小三)
  show heading.where(level: 3): set text(size: 字号.四号)
  show heading.where(level: 4): set text(size: 字号.小四)
  show heading: set block(above: 1.2em, below: 1.2em, sticky: false)

  // Reference
  show: show-set-supplement
  show figure: i-figured.show-figure
  show math.equation.where(block: true): i-figured.show-equation
  show figure.where(kind: table): set figure.caption(position: top)
  show: show-flex-caption
  doc
}

#let graduate-st(
  info: (:),
  twoside: false,
  bibsource: "",
  bibmode: "citext",
) = {
  assert(bibmode == "citext" or bibmode == "bilingual")
  let info = graduate-st-default-info + info
  let individual = template-individual.with(
    outlined: true,
    titlelevel: 1,
    bodytext-settings: (size: 字号.小四),
    titletext-settings: (size: 字号.小二, font: 字体.仿宋),
  )
  let bib = bib-provider(bibsource, mode: bibmode, title-case: true)
  let bibcontent = [
    #set par(leading: 10pt)
    #set text(size: 字号.小四, font: 字体.仿宋)
    #bib.bibcontent
  ]
  (
    pages: (
      cover: graduate-cover(
        info: info,
        title-settings: (
          label-font: 字体.宋体,
          label-size: 字号.三号,
          zh-content-size: 字号.小二,
          en-content-size: 字号.小二,
        ),
        personal-detail-settings: (
          items: ("申请人姓名", "指导教师", "合作导师", "专业学位类别", "专业学位领域", "所在学院"),
          label-font: 字体.宋体,
        ),
        submit-date-font: 字体.宋体,
        zju-emblem-scaling: 0.13,
      ),
      title-zh: graduate-title-zh(
        info: info,
        title-settings: (font: 字体.仿宋, twoline: false),
        zju-emblem-scaling: 0.13,
        other-font: 字体.宋体,
      ),
      title-en: graduate-title-en(info: info, title-twoline: false, zju-emblem-scaling: 0.13),
      decl: graduate-decl(),
      outline: {
        set outline(indent: 1em)
        show-outline(main-outline(
          outlined: false,
          titlelevel: 1,
          titletext-settings: (
            font: 字体.仿宋,
            size: 字号.小二,
          ),
          bodytext-settings: (size: 字号.小四),
        ))
      },
      figure-outline: figure-outline(
        outlined: true,
        titlelevel: 1,
        bodytext-settings: (size: 字号.小四),
        titletext-settings: (font: 字体.仿宋, size: 字号.小二),
      ),
      table-outline: table-outline(
        outlined: true,
        titlelevel: 1,
        titletext-settings: (font: 字体.仿宋, size: 字号.小二),
        bodytext-settings: (size: 字号.小四),
      ),
      individual: individual,
      bibliography: bibliography-page(bib: bibcontent, individual: individual),
    ),
    style: doc => {
      set document(title: info.title.join())
      let doc = graduate-st-set-style(doc, info.degree, twoside)
      show: bib.bibshow
      bib.hiddenbib + doc
    },
  )
}
