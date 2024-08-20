#let twoside-pagebreak = metadata(<mzt:twoside-pagebreak>)
#let twoside-emptypage = metadata(<mzt:twoside-emptypage>)

#let show-twoside-pagebreak(s, twoside: true) = {
  show metadata.where(value: <mzt:twoside-pagebreak>): pagebreak(
    weak: true,
    to: if twoside {
      "odd"
    },
  )

  show metadata.where(value: <mzt:twoside-emptypage>): [
    #if twoside {
      [ #pagebreak()#[#v(100%)]<no-header> ]
    }
  ]
  s
}