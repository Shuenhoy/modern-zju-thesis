#import "../pages/bachelor-cs-cover.typ": bachelor-cover
#import "../pages/bachelor-promise.typ": bachelor-promise
#import "../pages/bachelor-template-individual.typ": bachelor-template-individual
#import "../pages/bachelor-outline.typ": bachelor-outline
#import "../pages/bachelor-task.typ": bachelor-task
#import "../pages/bachelor-eval.typ": bachelor-eval
#import "../pages/bachelor-proposal-eval.typ": bachelor-proposal-eval

#import "../style/bachelor-cs.typ": bachelor-cs-set-style

#import "../utils/part.typ": *
#import "../utils/fonts.typ": *
#import "../utils/appendix.typ": *

#let info = (
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
