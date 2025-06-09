#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *
#import "./template-individual.typ": template-individual

#let undergraduate-task(info: (:), task, comment: none) = {
  template-individual("本科生毕业论文（设计）任务书", outlined: true)[
    #set text(size: 字号.小四)
    #h(-2em)#strong[一、题目：#info.title.join()<mzt:no-header-footer>]

    #h(-2em)#strong[二、指导教师对毕业论文（设计）的进度安排及任务要求：]

    #task

    #v(0.8fr)
    #strong[起讫日期 2025 #h(1.2em) 年 2#h(1.3em) 月 13#h(1.2em) 日 至 2025 #h(1.2em) 年 5#h(1.3em) 月13 #h(1.2em) 日]
    #v(1em)

    #strong(
      align(right)[
        指导教师（签名）#box(width: 5em, stroke: (bottom: 0.5pt)) 职称#box(width: 5em, stroke: (bottom: 0.5pt))],
    )

    #v(2em)
    #strong[#h(-2em)三、系或研究所意见：]


    #v(1fr)

    #strong(
      align(right)[
        负责人（签名）#box(width: 5em, stroke: (bottom: 0.5pt))\
        年#h(2em)月#h(2em)日
      ],
    )
  ]
}
