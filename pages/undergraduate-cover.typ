#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *


#let undergraduate-cover(
  info: (:),
  // 其他参数
  stoke-width: 0.5pt,
  row-gutter: 11.5pt,
  anonymous-info-keys: ("grade", "student-id", "author", "supervisor"),
) = {
  info = (
    (
      title: ("毕业论文/设计", "题目"),
      grade: "20XX",
      student-id: "1234567890",
      author: "张三",
      department: "某学院",
      major: "某专业",
      supervisor: ("李四", "教授"),
      submit-date: datetime.today(),
    )
      + info
  )


  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }

  context {
    twoside-pagebreak
    counter(page).update(0)

    set text(weight: "bold", font: 字体.仿宋)

    align(right)[
      涉密论文 $square$ #h(1em) 公开论文 $square$ #h(8em)
    ]

    set align(center)


    v(22pt)
    image("../assets/zju-name.svg", width: page.width * 0.5)
    v(2pt)

    text(size: 字号.小一, font: 字体.黑体, spacing: 50%)[本 科 生 毕 业 论 文<mzt:no-header-footer>]

    image("../assets/zju-emblem.svg", width: page.width * 0.17)

    v(20pt)


    block(
      width: 70%,
      [
        #set text(size: 字号.三号)
        #grid(
          columns: (0.5fr, 1fr),
          align: (start, center),
          rows: 1em,
          stroke: (x, y) => (
            bottom: if x == 1 {
              stoke-width
            } else {
              none
            },
          ),
          row-gutter: row-gutter,
          "题目", info.title.first(),
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
          "学生姓名", info.author,
          "学生学号", info.student-id,
          "指导教师", info.supervisor,
          "年级与专业", info.grade + info.major,
          "所在学院", info.department,
          grid.cell(stroke: none)[], grid.cell(stroke: none)[],
          "递交日期", info.submit-date,
        )
      ],
    )
  }
  twoside-emptypage
}
