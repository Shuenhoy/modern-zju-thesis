#import "./bachelor-template-individual.typ": bachelor-template-individual

#let bachelor-outline(
  title: [#v(1em) 目录],
  ..args,
) = {
  bachelor-template-individual(title, outline(depth: 3, title: none, ..args))

}