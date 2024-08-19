#import "./template-individual.typ": template-individual



#let main-outline(
  title: "目录",
  titlelevel: 2,
  outlined: false,
  ..args,
) = {
  template-individual(outlined: outlined, titlelevel: titlelevel, title, outline(depth: 3, title: none, ..args))

}