#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "./bachelor-template-individual.typ": bachelor-template-individual

#let bachelor-proposal-eval() = {
  bachelor-template-individual("毕业论文（设计）文献综述和开题报告考核", outlined: true)[
    #set text(weight: "bold", size: 字号.小四)
    导师对开题报告、外文翻译和文献综述的评语及成绩评定：<no-header>\

    #v(50mm)
    #align(right)[
      #table(
        columns: 4,
        align: center,
        [成绩比例], [文献综述#linebreak() （10%）], [开题报告#linebreak()（15%）], [外文翻译#linebreak()（5%）],
        [分值], [], [],
      )
      导师签名#box(width: 5em, stroke: (bottom: 0.5pt))\
      年#h(2em)月#h(2em)日
    ]

    #v(1em)
    学院盲审专家对开题报告、外文翻译和文献综述的评语及成绩评定：
    #v(1fr)



    #align(right)[
      #table(
        columns: 4,
        align: center,
        [成绩比例], [文献综述#linebreak() （10%）], [开题报告#linebreak()（15%）], [外文翻译#linebreak()（5%）],
        [分值], [], [],
      )
      开题报告审核负责人（签名/签章）#box(width: 5em, stroke: (bottom: 0.5pt))\
      年#h(2em)月#h(2em)日
    ]
  ]
}