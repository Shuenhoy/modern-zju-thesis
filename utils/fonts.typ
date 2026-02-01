#import "./global-options.typ": experimental-modern-fonts

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

#let fakebold-fonts = (
  "simsun",
  "simhei",
  "kaiti",
  "fangsong",
  "zhuque fangsong (technical preview)",
  "ar pl ukai",
)

#let fonts-canonical = (
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
  楷体: (
    (
      name: "Times New Roman",
      covers: "latin-in-cjk",
    ),
    "KaiTi",
  ),
  仿宋: (
    (
      name: "Times New Roman",
      covers: "latin-in-cjk",
    ),
    "FangSong",
  ),
  等宽: (
    "Noto Sans Mono CJK SC",
  ),
)

#let fonts-modern = (
  宋体: (
    (
      name: "STIX Two Text",
      covers: "latin-in-cjk",
    ),
    "Noto Serif CJK SC",
  ),
  黑体: (
    (
      name: "Arial",
      covers: "latin-in-cjk",
    ),
    "Noto Sans CJK SC",
  ),
  楷体: (
    (
      name: "STIX Two Text",
      covers: "latin-in-cjk",
    ),
    "AR PL UKai",
  ),
  仿宋: (
    (
      name: "STIX Two Text",
      covers: "latin-in-cjk",
    ),
    "Zhuque Fangsong (technical preview)",
  ),
  等宽: (
    "Noto Sans Mono CJK SC",
  ),
)


#let 字体 = if experimental-modern-fonts {
  fonts-modern
} else {
  fonts-canonical
}

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
