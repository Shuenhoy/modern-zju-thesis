#import "../utils/fonts.typ": 字体, 字号
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *

#let graduate-title-zh(
  info: (:),
  // 其他参数
  stroke-width: 0.5pt,
  row-gutter: 11.5pt,
  degree: "硕士",
  zju-emblem-scaling: 0.15,
  title-settings: (font: 字体.宋体, twoline: true),
) = {
  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }


  context {
    set text(font: 字体.宋体)
    twoside-pagebreak
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
        #set text(size: 字号.小二, font: title-settings.font, weight: "bold")
        #if title-settings.twoline {
          grid(
            columns: 1fr,
            align: (center),
            stroke: (bottom: stroke-width),
            info.title.first(),
            ..info.title.slice(1),
            grid.cell(stroke: none)[], grid.cell(stroke: none)[],
          )
        } else {
          grid(
            columns: 1fr,
            align: (center),
            stroke: (bottom: stroke-width),
            info.title.join(""),
            grid.cell(stroke: none)[], grid.cell(stroke: none)[],
          )
        }
      ],
    )
    v(-50pt)

    [#image("../assets/zju-emblem.svg", width: page.width * zju-emblem-scaling)<mzt:no-header-footer>]
    v(1em)

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
        )
      ],
    )
    if info.title.len() <= 2 {
      v(20pt)
    }
    block(
      width: 70%,
      [
        #set text(size: 字号.四号)
        #grid(
          columns: (auto, 1fr),
          align: (end, center),

          "论文评阅人1：", info.reviewer.at(0),
          ..info.reviewer.enumerate(start: 0).slice(1).map(v => ([评阅人#(v.at(0) + 1)：], v.at(1))).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],

          "答辩委员会主席 ：", info.committe.at(0),
          ..info.committe.enumerate(start: 0).slice(1).map(v => ([委员#(v.at(0))：], v.at(1))).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
        #align(center)[
          #grid(
            columns: (auto, 10em),
            align: (start, center),
            "答辩日期：", info.defense-date.at(0),
          )
        ]
      ],
    )
  }
  twoside-emptypage
}
