#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display


#let graduate-title-zh(
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  stroke-width: 0.5pt,
  row-gutter: 11.5pt,
  degree: "硕士",
) = {
  fonts = 字体 + fonts

  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }

  context {
    pagebreak(
      weak: true,
      to: if twoside {
        "odd"
      },
    )
    counter(page).update(0)
    v(-40pt)
    set grid(
      row-gutter: row-gutter,
      rows: 1em,
      stroke: (x, y) => (
        bottom: if x == 1 {
          stroke-width
        } else {
          none
        },
      ),
    )



    set align(center)



    v(20pt)
    block(
      width: 80%,
      [
        #set text(size: 字号.小二, weight: "bold")
        #grid(
          columns: (1fr),
          align: (center),
          stroke: (bottom: stroke-width),
          info.title.first(),
          ..info.title.slice(1),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
      ],
    )
    v(-40pt)

    [#image("../assets/zju-emblem.svg", width: page.width * 0.15)<no-header>]


    block(
      width: 60%,
      [
        #set text(size: 字号.三号, weight: "bold")
        #grid(
          columns: (auto, 0.8fr),
          align: (start, center),

          "论文作者签名：", [],
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
          "指导教师签名：", [],
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],

        )
      ],
    )
    block(
      width: 70%,
      [
        #set text(size: 字号.四号)
        #grid(
          columns: (auto, 1fr),
          align: (end, center),

          "论文评阅人1：", info.reviewer.at(0) ,
          ..info.reviewer.enumerate(start: 0).slice(1).map(v => ([评阅人#(v.at(0)+1)：], v.at(1))).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],




          "答辩委员会主席 ：", info.committe.at(0) ,
          ..info.committe.enumerate(start: 0).slice(1).map(v => ([委员#(v.at(0))：], v.at(1))).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],


        )
        #align(right)[
          #grid(
            columns: (auto, 10em),
            align: (start, center),
            "答辩日期：", info.defense-date.at(0),
          )
        ]
      ],
    )


  }
}