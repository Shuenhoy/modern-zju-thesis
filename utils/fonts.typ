#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let 字体 = (
  宋体: (
    (
      name: "Times New Roman",
      covers: "latin-in-cjk",
    ),
    "SimSun",
  ),
  黑体: (
    (
      name: "Arial",
      covers: "latin-in-cjk",
    ),
    "SimHei",
  ),
  // 楷体
  楷体: (
    (
      name: "Times New Roman",
      covers: "latin-in-cjk",
    ),
    "KaiTi",
  ),
  // 仿宋
  仿宋: (
    (
      name: "Times New Roman",
      covers: "latin-in-cjk",
    ),
    "FangSong",
  ),
  等宽: (
    "Courier New",
    "Menlo",
    "IBM Plex Mono",
    "Source Han Sans HW SC",
    "Source Han Sans HW",
    "Noto Sans Mono CJK SC",
    "SimHei",
    "Heiti SC",
    "STHeiti",
  ),
)

#let songti(s) = {
  set text(font: 字体.宋体)
  s
}

#let heiti(s) = {
  set text(font: 字体.黑体)
  s
}

#let kaiti(s) = {
  set text(font: 字体.楷体)
  s
}

#let fangsong(s) = {
  set text(font: 字体.仿宋)
  s
}
