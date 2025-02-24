#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *
#import "./template-individual.typ": template-individual

#let undergraduate-proposal-task(info: (:), s) = {
  template-individual(none, outlined: false)[
    #set text(size: 字号.小四)
    #strong[
      一、题目：#info.title.join()<mzt:no-header-footer>\
      二、指导教师对文献综述开题报告、外文翻译的具体要求：]

    #s

    #v(1fr)


    #strong(
      align(right)[
        指导教师（签名）#box(width: 5em, stroke: (bottom: 0.5pt))],
    )


  ]
  twoside-emptypage
}
