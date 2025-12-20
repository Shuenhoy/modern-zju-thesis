#import "./template-individual.typ": template-individual
#import "../dependency/i-figured.typ"
#import "../utils/fonts.typ": 字体, 字号

#let main-outline(
  title: "目录",
  titlelevel: 2,
  outlined: false,
  titletext-settings: (
    size: 字号.小三,
    font: 字体.仿宋,
  ),
  ..args,
) = {
  template-individual(
    outlined: outlined,
    titlelevel: titlelevel,
    titletext-settings: titletext-settings,
    title,
    outline(depth: 3, title: none, ..args),
  )
}

#let figure-outline(
  title: "图目录",
  titlelevel: 2,
  outlined: false,
  titletext-settings: (
    size: 字号.小三,
    font: 字体.仿宋,
  ),
  ..args,
) = {
  template-individual(
    outlined: outlined,
    titlelevel: titlelevel,
    titletext-settings: titletext-settings,
    title,
    i-figured.outline(depth: 3, title: none, target-kind: image, ..args),
  )
}

#let table-outline(
  title: "表目录",
  titlelevel: 2,
  outlined: false,
  titletext-settings: (
    size: 字号.小三,
    font: 字体.仿宋,
  ),
  ..args,
) = {
  template-individual(
    outlined: outlined,
    titlelevel: titlelevel,
    titletext-settings: titletext-settings,
    title,
    i-figured.outline(depth: 3, title: none, target-kind: table, ..args),
  )
}
)
