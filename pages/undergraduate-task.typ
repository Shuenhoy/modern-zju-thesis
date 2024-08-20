#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *
#import "./template-individual.typ": template-individual

#let undergraduate-task() = {
  template-individual("本科生毕业论文（设计）任务书", outlined: true)[
    #set text(weight: "bold", size: 字号.小四)
    一、题目：<no-header>\
    二、指导教师对毕业论文（设计）的进度安排及任务要求：

    #v(50mm)

    起讫日期 20 #h(1.5em) 年 #h(1.5em) 月 #h(1.5em) 日 至 20 #h(1.5em) 年 #h(1.5em) 月 #h(1.5em) 日
    #v(1em)

    #align(right)[
      指导教师（签名）#box(width: 5em, stroke: (bottom: 0.5pt)) 职称#box(width: 5em, stroke: (bottom: 0.5pt))]

    #v(1em)
    三、系或研究所意见：
    #v(1fr)

    #align(right)[
      负责人（签名）#box(width: 5em, stroke: (bottom: 0.5pt))\
      年#h(2em)月#h(2em)日
    ]
  ]
  twoside-emptypage
}