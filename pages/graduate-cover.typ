#import "../utils/fonts.typ": songti, 字体, 字号
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *

#let graduate-cover(
  info: (:),
  personal-detail-settings: (
    items: ("申请人姓名", "指导教师", "专业名称", "研究方向", "所在学院"),
    label-font: 字体.宋体,
  ),
  stoke-width: 0.5pt,
  row-gutter: 11.5pt,
  zju-emblem-scaling: 0.15,
  title-settings: (
    label-font: 字体.宋体,
    label-size: 字号.小二,
    zh-content-size: 字号.小二,
    en-content-size: 16pt,
  ),
  submit-date-font: 字体.宋体,
) = {
  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }
  twoside-pagebreak

  let zh-title = text.with(size: title-settings.zh-content-size)
  let en-title = text.with(size: title-settings.en-content-size)
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

    // Title
    // Generate grid cells for title rows (label + first line + subsequent lines)
    let title-grid-cells = (label, lines, title-render) => {
      (
        text(font: title-settings.label-font, size: title-settings.label-size)[#label],
        title-render(lines.first()),
        ..lines.slice(1).map(line => (none, title-render(line))).flatten(),
      )
    }
    // Render title grid with specified column layout
    let title-grid = (columns, label, lines, title-render) => {
      set text(size: 字号.小二, weight: "bold")
      grid(
        columns: columns,
        align: (start, center),
        ..title-grid-cells(label, lines, title-render),
      )
    }
    // Measure title grid width for adaptive sizing
    let title-grid-width = (label, lines, title-render) => {
      measure(title-grid((auto, auto), label, lines, title-render)).width
    }
    let needed-title-width = calc.max(
      title-grid-width("中文论文题目：", info.title, zh-title),
      title-grid-width("英文论文题目：", info.title-en, en-title),
    )
    let content-width = page.width - page.margin.left - page.margin.right
    let resolved-title-block-width = (
      100%
        * calc.clamp(
          needed-title-width / content-width + 0.02,
          0.8,
          1.0,
        )
    )
    block(
      width: resolved-title-block-width,
      title-grid((auto, 1fr), "中文论文题目：", info.title, zh-title),
    )
    if (info.title.len() <= 2 or info.title-en.len() <= 2) {
      v(20pt)
    }
    block(
      width: resolved-title-block-width,
      title-grid((auto, 1fr), "英文论文题目：", info.title-en, en-title),
    )

    v(2em)

    let personal-detail-items-map = (
      "申请人姓名": (text("申请人姓名：", font: personal-detail-settings.label-font), info.author),
      "指导教师": (text("指导教师：", font: personal-detail-settings.label-font), info.supervisor),
      "合作导师": (text("合作导师：", font: personal-detail-settings.label-font), info.co-supervisor),
      "专业名称": (text("专业名称：", font: personal-detail-settings.label-font), info.grade + info.major),
      "专业学位类别": (text("专业学位类别：", font: personal-detail-settings.label-font), info.major),
      "研究方向": (text("研究方向：", font: personal-detail-settings.label-font), info.field),
      "专业学位领域": (text("专业学位领域：", font: personal-detail-settings.label-font), info.field),
      "所在学院": (text("所在学院：", font: personal-detail-settings.label-font), info.department),
      "校内导师": (text("校内导师：", font: personal-detail-settings.label-font), info.supervisor),
      "校外导师": (text("校外导师：", font: personal-detail-settings.label-font), info.co-supervisor),
    )
    block(
      width: 60%,
      [
        #set text(size: 字号.四号)
        #grid(
          columns: (auto, 1fr),
          align: (start, center),
          ..personal-detail-settings
            .items
            .filter(item => item in personal-detail-items-map and personal-detail-items-map.at(item).at(1) != none)
            .map(item => personal-detail-items-map.at(item))
            .flatten(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
        )
        #align(center)[
          #set text(size: 字号.小三)
          #grid(
            columns: (auto, 10em),
            align: (start, center),
            text("论文提交日期 ", font: submit-date-font, weight: "bold"), info.submit-date,
          )
        ]
      ],
    )
  }
  twoside-emptypage
}
