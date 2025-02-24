#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *

#let graduate-title-en(
  info: (:),
  // 其他参数
  stroke-width: 0.5pt,
  row-gutter: 11.5pt,
  degree: "硕士",
) = {
  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }

  context {
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
        #set text(size: 16pt, weight: "bold")
        #grid(
          columns: 1fr,
          align: (center),
          stroke: (bottom: stroke-width),
          info.title-en.first(),
          ..info.title-en.slice(1),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
      ],
    )
    v(-40pt)

    [#image("../assets/zju-emblem.svg", width: page.width * 0.15)<mzt:no-header-footer>]


    block(
      width: 60%,
      [
        #set text(size: 字号.三号, weight: "bold")
        #grid(
          columns: (auto, 0.8fr),
          align: (end, center),

          "Author's signature:", [],
          "Supervisor's signature:", [],
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

          ..info.reviewer-en.enumerate(start: 0).map(v => ([Thesis reviewer #(v.at(0)+1):], v.at(1))).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
        #grid(
          columns: (auto, 15em),
          align: (end, center),
          "Chair:", info.committe-en.at(0),
        )
        #v(-1em)
        #align(left)[#h(-1em)#text(size: 字号.五号)[(Committee of oral defence)]]
        #grid(
          columns: (auto, 1fr),
          align: (end, center),

          ..info.committe-en.enumerate(start: 0).slice(1).map(v => ([Committeeman #(v.at(0)):], v.at(1))).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
        #align(center)[
          #grid(
            columns: (auto, 10em),
            align: (start, center),
            "Date of oral defence:", info.defense-date.at(1),
          )
        ]
      ],
    )
  }
  twoside-emptypage
}
