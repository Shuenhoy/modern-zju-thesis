#import "../lib.typ": undergraduate-cs
#import undergraduate-cs: *

#let info = (
  title: ("毕业论文/设计题目",),
  grade: "2014级",
  student-id: "学号",
  author: "姓名",
  department: "学院",
  major: "专业",
  supervisor: "指导教师",
  submit-date: "递交日期",
)


#let doc = undergraduate-cs(info: info, twoside: true)
#show: doc.style

#doc.pages.cover

#show: frontmatter

#doc.pages.decl

#let individual = doc.pages.individual

#individual("致 谢")[]
#individual("摘 要")[]
#individual("Abstract")[]

#doc.pages.outline

#show: mainmatter

#part[毕业论文]
#include "common-body.typ"

#bibliography("ref.bib", style: "gb-7714-2015-numeric")
#individual("参考文献", outlined: true)[
  #part-bib
]

#individual("附录", outlined: true)[
  #appendix[
    === 一个附录 <app1>
    @app1
    === 另一个附录

  ]
]

#individual("作者简历", outlined: true)[
  *基本信息：*
  - 姓名：
  - 性别：
  - 民族：
  - 出生年月：
  - 籍贯：

  *教育经历：*
  - 2199.09 - 2203.06：浙江大学攻读学士学位

]

#(doc.pages.task)()[任务]
#(doc.pages.eval)(scores: (8, 15, 5, 60))[评价]

#part[开题报告]
#doc.pages.proposal-cover
#(doc.pages.proposal-task)[
  内容
]


#counter(page).update(0)
= 文献综述

@zjugradthesisrules

== 参考文献
#part-bib

= 开题报告
== 参考文献
#part-bib
= 外文翻译
= 外文原文


#(doc.pages.proposal-eval)(scores-supervisor: (8, 15, 5))[评价]