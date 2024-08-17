#import "../lib.typ": *

#let info = (
  info: (
    title: ("毕业论文/设计题目",),
    title-en: "My Title in English",
    grade: "2014级",
    student-id: "学号",
    author: "姓名",
    author-en: "Ming Xing",
    department: "学院",
    department-en: "School of Chemistry and Chemical Engineering",
    major: "专业",
    major-en: "Chemistry",
    supervisor: ("指导教师", "教授"),
    supervisor-en: "Professor My Supervisor",
    submit-date: "递交日期",
  ),
)

#show bibliography: none




#let doc = bachelor-cs(info)
#show: doc.style
#bibliography("ref.bib")



#doc.pages.cover

#set page(numbering: "I")


#doc.pages.promise

#let individual = doc.pages.individual

#individual("致 谢")[]
#individual("摘 要")[]
#individual("Abstract")[]

#doc.pages.outline

#set page(numbering: "1")
#part[毕业论文]<part1>

#include "common-body.typ"

#heading(numbering: none, level: 2, [参考文献])
#part-bib

#appendix[
  === 一个附录 <app1>
  @app1
  === 另一个附录

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

#doc.pages.task
#(doc.pages.eval)()

#part[开题报告]<part2>

= 文献综述
@zjugradthesisrules

== 参考文献
#part-bib

= 开题报告
== 参考文献
#part-bib
= 外文翻译
= 外文原文


#doc.pages.proposal-eval