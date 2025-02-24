#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/indent-first-par.typ": fake-par
#import "./template-individual.typ": template-individual

#let undergraduate-decl(
  row-gutter: 11.5pt,
) = {
  template-individual("浙江大学本科生毕业论文（设计）承诺书")[
    #set underline(offset: 0.2em)
    #show enum.item: x => [ #x.number. #x.body]
    #fake-par

    1. 本人郑重地承诺所呈交的毕业论文（设计），是在指导教师的指导下严格按照学校和学院有关规定完成的。

    2. 本人在毕业论文（设计）中除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得#underline[*浙江大学*]或其他教育机构的学位或证书而使用过的材料。

    3. 与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。

    4. 本人承诺在毕业论文（设计）工作过程中没有伪造数据等行为。

    5. 若在本毕业论文（设计）中有侵犯任何方面知识产权的行为，由本人承担相应的法律责任。

    6. 本人完全了解#underline[*浙江大学*]有权保留并向有关部门或机构送交本论文（设计）的复印件和磁盘，允许本论文（设计）被查阅和借阅。本人授权#underline[*浙江大学*]可以将本论文（设计）的全部或部分内容编入有关数据库进行检索和传播，可以采用影印、缩印或扫描等复制手段保存、汇编本论文（设计）。

    #v(1fr)

    #align(center)[
      #table(
        columns: (0.5fr, 0.4fr, 0.5fr, 0.4fr),
        align: (start, center),
        stroke: none,
        row-gutter: row-gutter,
        [ 作者签名： ], [], [ 导师签名： ], [],
        [], [], [], [],
        [ 签字日期： ], [ 年 #h(1em) 月#h(1em)日], [ 签字日期： ], [ 年#h(1em)月#h(1em)日],
      )
    ]
  ]
}
