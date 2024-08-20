#import "../lib.typ": *

#let info = graduate-general-default-info + (
  title: ("毕业论文/设计题目", ""),
  title-en: ("Graduation Thesis Title", ""),
  grade: "2014级",
  student-id: "学号",
  author: "姓名",
  department: "学院",
  major: "专业",
  degree: "博士",
  supervisor: "指导教师",
  submit-date: "递交日期",
)

#show bibliography: none




#let doc = graduate-general(info: info, twoside: true)
#show: doc.style
#bibliography("ref.bib")



#doc.pages.cover
#doc.pages.title-zh
#doc.pages.title-en

#doc.pages.decl

#set page(numbering: "I")
#counter(page).update(1)

#let individual = doc.pages.individual
#individual("致 谢")[]
#individual("摘 要")[]
#individual("Abstract")[]

#doc.pages.outline

#set page(numbering: "1")
#counter(page).update(1)

#include "common-body.typ"

#individual("参考文献", outlined: true)[
  #part-bib
]

#individual("附录", outlined: true)[
  #appendix(level: 1)[
    == 一个附录 <app1>
    @app1
    == 另一个附录

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

  *攻读硕士学位期间主要的研究成果：*

]
