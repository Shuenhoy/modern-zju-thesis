#import "../lib.typ": flex-caption, graduate-st
#import graduate-st: *

#let info = (
  title: ("小二号仿宋字体", "加粗"),
  title-en: ("小二号 Times New Roman", "加粗"),
  author: "申请人姓名",
  supervisor: "指导教师姓名",
  co-supervisor: "合作导师姓名",
  degree: "硕士",
  marjor: "电子信息或机械",
  field: "软件工程",
  department: "软件学院",
)

#let doc = graduate-st(info: info, twoside: false, bibsource: read("ref.bib"), bibmode: "citext")

#show: doc.style

#doc.pages.cover
#doc.pages.title-zh
#doc.pages.title-en
#doc.pages.decl


#let individual = doc.pages.individual

#show: abstractmatter

#individual("摘 要")[
  摘要摘要

  *关键词：*关键词，关键词
]
#individual("Abstract")[
  #lorem(100)

  *Keywords:* Keywords, Keywords
]


#show: frontmatter
#doc.pages.outline
#doc.pages.figure-outline
#doc.pages.table-outline

#show: mainmatter

#include "common-body.typ"

#doc.pages.bibliography

#individual("致 谢", outlined: true)[
  旧历的年底毕竟最像年底，村镇上不必说，就在天空中也显出将到新年的气象来。灰白色的沉重的晚云中间时时发出闪光，接着一声钝响，是送灶的爆竹；近处燃放的可就更强烈了，震耳的大音还没有息，空气里已经散满了幽微的火药香。我是正在这一夜回到我的故乡鲁镇的。

  虽说故乡，然而已没有家，所以只得暂寓在鲁四老爷的宅子里。他是我的本家，比我长一辈，应该称之曰“四叔”，是一个讲理学的老监生。他比先前并没有甚么大改变，单是老了些，但也还未留胡子，一见面是寒暄，寒暄之后说我“胖了”，说我“胖了”之后即大骂其新党。但我知道，这并非借题在骂我：因为他所骂的还是康有为。但是，谈话是总不投机的了，于是不多久，我便一个人剩在书房里。
]

#individual("附录", outlined: true)[
  #appendix(level: 1)[
    == 一个附录 <app1>
    @app1
    == 另一个附录

  ]
]

#individual("作者简历", outlined: true)[
  *基本信息：*
  - 姓名：
  - 性别：
  - 民族：
  - 出生年月：
  - 籍贯：

  *教育经历：*
  - 2199.09 - 2203.06：浙江大学攻读学士学位

  *攻读#(info.degree)学位期间主要的研究成果：*

]
