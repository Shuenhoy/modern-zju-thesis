#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display


#let graduate-cover(
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  stoke-width: 0.5pt,
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
          stoke-width
        } else {
          none
        },
      ),
    )
    set align(center)

    [
      #set text(size: 字号.小四, font: 字体.宋体)

      #grid(
        columns: (auto, auto, 1fr, auto, auto),
        align: (left, center, left, left, center),
        stroke: (x, y) => (
          bottom: if x == 1 or x == 4 {
            stoke-width
          } else {
            none
          },
        ),
        [分类号：], [#info.clc], [], [单位代码：], [#info.unitcode],
        [密#h(1em)级：], [#info.secret-level], [], [学#h(2em)号：], info.student-id,
      )
    ]



    pad(image("../assets/zju-name.svg", width: page.width * 0.5), left: 0.4cm)
    v(-30pt)

    text(size: 字号.小一, font: fonts.宋体)[#(degree)学位论文<no-header>]

    image("../assets/zju-emblem.svg", width: page.width * 0.15)

    v(20pt)
    block(
      width: 80%,
      [
        #set text(size: 字号.小二, weight: "bold")
        #grid(
          columns: (auto, 1fr),
          align: (start, center),
          "中文论文题目：", info.title.first(),
          ..info.title.slice(1).map(v => (none, v)).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
          "英文论文题目：", text(size: 16pt, info.title-en.first()),
          ..info.title-en.slice(1).map(v => (none, text(size: 16pt, v))).flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],

        )
      ],
    )


    block(
      width: 60%,
      [
        #set text(size: 字号.四号)
        #grid(
          columns: (auto, 1fr),
          align: (start, center),

          "申请人姓名：", info.author ,
          "指导教师：", info.supervisor,
          "学科（专业）：", info.grade + info.major,
          "研究方向：", info.field,
          "所在学院：", info.department,
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
      ],
    )

    block(
      width: 50%,
      [
        #set text(size: 字号.小三, weight: "bold")
        #grid(
          columns: (0.5fr, 0.3fr),
          align: (start, center),
          "论文递交日期", info.submit-date,
        )
      ],
    )
  }
}