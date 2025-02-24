#import "./template-individual.typ": template-individual
#import "../dependency/i-figured.typ"


#let main-outline(
  title: "目录",
  titlelevel: 2,
  outlined: false,
  ..args,
) = {
  template-individual(outlined: outlined, titlelevel: titlelevel, title, outline(depth: 3, title: none, ..args))
}

#let figure-outline(
  title: "图目录",
  titlelevel: 2,
  outlined: false,
  ..args,
) = {
  template-individual(
    outlined: outlined,
    titlelevel: titlelevel,
    title,
    i-figured.outline(depth: 3, title: none, target-kind: image, ..args),
  )
}

#let table-outline(
  title: "表目录",
  titlelevel: 2,
  outlined: false,
  ..args,
) = {
  template-individual(
    outlined: outlined,
    titlelevel: titlelevel,
    title,
    i-figured.outline(depth: 3, title: none, target-kind: table, ..args),
  )
}
)
