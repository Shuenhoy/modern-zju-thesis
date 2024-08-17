#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display


#let bachelor-cover(
  // documentclass 传入的参数
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  stoke-width: 0.5pt,
  row-gutter: 11.5pt,
  anonymous-info-keys: ("grade", "student-id", "author", "supervisor"),
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  info = (
    title: ("毕业论文/设计", "题目"),
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    department: "某学院",
    major: "某专业",
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
  ) + info


  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }

  context {
    // 4.  正式渲染

    pagebreak(
      weak: true,
      to: if twoside {
        "odd"
      },
    )
    counter(page).update(0)

    set text(weight: "bold", font: fonts.仿宋)

    align(right)[
      涉密论文 $square$ #h(1em) 公开论文 $square$ #h(8em)
    ]

    // 居中对齐
    set align(center)


    v(22pt)
    // 调整一下左边的间距
    pad(image("../assets/zju-name.svg", width: page.width * 0.5), left: 0.4cm)
    v(2pt)

    // 将中文之间的空格间隙从 0.25 em 调整到 0.5 em
    text(size: 字号.小一, font: fonts.黑体, spacing: 50%)[本 科 生 毕 业 论 文<no-header>]

    // 封面图标
    image("../assets/zju-emblem.svg", width: page.width * 0.17)

    v(20pt)


    block(
      width: 70%,
      [
        #set text(size: 字号.三号)
        #table(
          columns: (0.5fr, 1fr),
          align: (start, center),
          stroke: (x, y) => (
            bottom: if x == 1 {
              stoke-width
            } else {
              none
            },
          ),
          row-gutter: row-gutter,
          "题目", info.title.first(),
          ..info.title.slice(1).map(v => (none, v)).flatten(),
          table.cell(stroke: none)[], table.cell(stroke: none)[],
          "姓名与学号", info.author + " " + info.student-id,
          "指导教师", info.supervisor.at(0),
          "年级与专业", info.grade + info.major,
          "所在学院", info.department,
          table.cell(stroke: none)[], table.cell(stroke: none)[],
          "递交日期", info.submit-date,
        )
      ],
    )
  }
}