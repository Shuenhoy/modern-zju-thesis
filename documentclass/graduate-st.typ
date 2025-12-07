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
#import "../utils/bib-provider.typ": bib-provider
#import "../utils/structure.typ": frontmatter, mainmatter
#import "../utils/appendix.typ": appendix
#import "../utils/flex-caption.typ": show-flex-caption

#import "../dependency/i-figured.typ"

#let graduate-st-default-info = (
  title: ("小二号仿宋字体 加粗", ""),
  title-en: ("小二号 Times New Roman 字体 加粗", ""),
  grade: "20XX",
  student-id: "1234567890",
  clc: "TP311.5",
  unitcode: "10335",
  reviewer: ("", "", "", "", ""),
  committe: ("主席", "委员", "委员", "委员", "委员", "委员"),
  reviewer-en: ("", "", "", "", ""),
  committe-en: ("Chair", "Committeeman", "Committeeman", "Committeeman", "Committeeman", "Committeeman"),
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
    header-ascent: 0.8cm,
    footer-descent: 0.8cm,
    header: header(
      left: [浙江大学#(degree)学位论文],
      right: near-chapter,
      size: 10.5pt,
    ),
    footer: twoside-numbering-footer,
  )
  doc
}
#let graduate-st(
  info: (:),
  twoside: false,
  bibsource: "",
  bibmode: "citext",
) = {
  let info = graduate-st-default-info + info
  (
    style: doc => {
      set document(title: info.title.join())
      let doc = graduate-st-set-style(doc, info.degree, twoside)
      doc
    },
  )
}
