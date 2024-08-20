#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": *

#let graduate-decl(
  twoside: false,
  outlined: false,
  row-gutter: 11.5pt,
) = {

  context {
    twoside-pagebreak
    set text(font: 字体.宋体)
    let zju = underline[#text(font: 字体.楷体, weight: "bold")[浙江大学]]
    block(width: 100%)[
      #set par(justify: true)
      #set text(size: 字号.小四)

      #align(center)[
        #set text(size: 字号.小二)
        浙江大学研究生学位论文独创性声明<no-header>
      ]
      #v(2em)

      本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得#(zju)或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。
      #v(2em)
      #align(center)[
        #table(
          columns: (0.5fr, 0.4fr, 0.5fr, auto),
          align: (start, center),
          stroke: none,
          row-gutter: row-gutter,
          [ 学位论文作者签名： ], [], [ 签字日期： ], [ 年#h(2em)月#h(2em)日],
        )
      ]

      #v(4em)

      #align(center)[
        #set text(size: 字号.小二)
        学位论文版权使用授权书<no-header>
      ]
      #v(2em)

      本学位论文作者完全了解#(zju)有权保留并向国家有关部门或机构送交本论文的复印件和磁盘，允许论文被查阅和借阅。本人授权#(zju)可以将学位论文的全部或部分内容编入有关数据库进行检索和传播，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。

      （保密的学位论文在解密后适用本授权书）

      #v(2em)

      #align(center)[
        #table(
          columns: (0.5fr, auto, 0.5fr, auto),
          align: (start, center),
          stroke: none,
          row-gutter: row-gutter,
          [ 学位论文作者签名： ], [], [ 导师签名： ], [],
          [], [], [], [],
          [ 签字日期： ], [ 年#h(2em)月#h(2em)日], [ 签字日期： ], [年#h(2em)月#h(2em)日],
        )
      ]


    ]
  }
  twoside-emptypage
}