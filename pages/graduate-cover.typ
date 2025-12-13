#import "../utils/fonts.typ": songti, 字体, 字号
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *

#let graduate-cover(
  info: (:),
  personal-detail-items: ("申请人姓名", "指导教师", "专业名称", "研究方向", "所在学院"),
  stoke-width: 0.5pt,
  row-gutter: 11.5pt,
  zju-emblem-scaling: 0.15,
  size-settings: (
    title: 字号.小二,
    zh-content: 字号.小二,
    en-content: 16pt,
  ),
) = {
  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }
  twoside-pagebreak

  let zh-title = text.with(size: size-settings.zh-content)
  let en-title = text.with(size: size-settings.en-content)
  context {
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


    image("../assets/zju-name-graduate.png", width: page.width * 0.3)
    v(-30pt)

    text(size: 字号.小一, font: 字体.宋体)[#(info.degree)学位论文<mzt:no-header-footer>]

    image("../assets/zju-emblem.svg", width: page.width * zju-emblem-scaling)

    v(20pt)
    block(
      width: 80%,
      [
        #set text(size: 字号.小二, weight: "bold")
        #grid(
          columns: (auto, 1fr),
          align: (start, center),
          text(font: 字体.宋体, size: size-settings.title)[中文论文题目：],
          zh-title(info.title.first()),
          ..info.title.slice(1).map(v => (none, zh-title(v))).flatten(),
        )
      ],
    )
    if (info.title.len() <= 2 or info.title-en.len() <= 2) {
      v(20pt)
    }
    block(
      width: 80%,
      [
        #set text(size: 字号.小二, weight: "bold")
        #grid(
          columns: (auto, 1fr),
          align: (start, center),
          text(font: 字体.宋体, size: size-settings.title)[英文论文题目：],
          en-title(info.title-en.first()),
          ..info
            .title-en
            .slice(1)
            .map(v => (
              none,
              en-title(v),
            ))
            .flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
      ],
    )

    let personal-detail-items-map = (
      "申请人姓名": (songti("申请人姓名："), info.author),
      "指导教师": (songti("指导教师："), info.supervisor),
      "合作导师": (songti("合作导师："), info.co-supervisor),
      "专业名称": (songti("专业名称："), info.grade + info.major),
      "专业学位类别": (songti("专业学位类别："), info.major),
      "研究方向": (songti("研究方向："), info.field),
      "专业学位领域": (songti("专业学位领域："), info.field),
      "所在学院": (songti("所在学院："), info.department),
      "校内导师": (songti("校内导师："), info.supervisor),
      "校外导师": (songti("校外导师："), info.co-supervisor),
    )
    block(
      width: 60%,
      [
        #set text(size: 字号.四号)
        #grid(
          columns: (auto, 1fr),
          align: (start, center),
          ..personal-detail-items
            .filter(item => item in personal-detail-items-map and personal-detail-items-map.at(item).at(1) != none)
            .map(item => personal-detail-items-map.at(item))
            .flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
        #align(right)[
          #set text(size: 字号.小三, weight: "bold")
          #grid(
            columns: (auto, 10.5em),
            align: (start, center),
            songti("论文提交日期"), songti(info.submit-date),
          )
        ]
      ],
    )
  }
  twoside-emptypage
}
