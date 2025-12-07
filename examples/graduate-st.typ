#import "../lib.typ": graduate-st
#import graduate-st: *

#let info = (
  title: ("小二号仿宋字体 加粗", ""),
  title-en: ("小二号 Times New Roman 字体 加粗", ""),
  author: "申请人姓名",
  supervisor: "指导教师姓名",
  co-supervisor: "合作导师姓名",
  marjor: "电子信息或机械",
  field: "软件工程或人工智能或工业设计工程",
  department: "软件学院",
)

#let doc = graduate-st(info: info, twoside: true, bibsource: read("ref.bib"), bibmode: "citext")

#show: doc.style

= 第一章

#lorem(1000)
