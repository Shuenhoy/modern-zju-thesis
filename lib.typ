#import "pages/bachelor-cs-cover.typ": bachelor-cover
#import "pages/bachelor-promise.typ": bachelor-promise
#import "pages/bachelor-template-individual.typ": bachelor-template-individual
#import "pages/bachelor-outline.typ": bachelor-outline
#import "pages/bachelor-task.typ": bachelor-task
#import "pages/bachelor-eval.typ": bachelor-eval
#import "pages/bachelor-proposal-eval.typ": bachelor-proposal-eval

#import "style/bachelor-cs.typ": bachelor-cs-set-style

#import "utils/part.typ": *

#import "utils/fonts.typ": *

#let info = (
    title: ("毕业论文/设计题目",),
    title-en: "NJU Thesis Template for Typst",
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    author-en: "Zhang San",
    department: "某学院",
    department-en: "XX Department",
    major: "某专业",
    major-en: "XX Major",
    field: "某方向",
    field-en: "XX Field",
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
    // 以下为研究生项
    defend-date: datetime.today(),
    confer-date: datetime.today(),
    bottom-date: datetime.today(),
    chairman: "某某某 教授",
    reviewer: ("某某某 教授", "某某某 教授"),
    clc: "O643.12",
    udc: "544.4",
    secret-level: "公开",
    supervisor-contact: "南京大学 江苏省南京市栖霞区仙林大道163号",
    email: "xyz@smail.nju.edu.cn",
    school-code: "10284",
    degree: auto,
    degree-en: auto,
  )

#let bachelor-cs(config) = {
  (
    pages: (
      cover: bachelor-cover(info: info + config.info),
      promise: bachelor-promise(),
      outline: bachelor-outline(target: chapters-and-headings),
      task: bachelor-task(),
      individual: bachelor-template-individual,
      eval: bachelor-eval,
      proposal-eval: bachelor-proposal-eval(),
    ),
    style: doc => {
      set document(title: info.title.join())
      show: bachelor-cs-set-style
      doc
    },
  )
}
