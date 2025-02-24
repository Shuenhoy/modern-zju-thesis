#import "../utils/header.typ": footer

#let twoside-pagebreak = metadata(<mzt:twoside-pagebreak>)
#let twoside-emptypage = metadata(<mzt:twoside-emptypage>)
#let twoside-numbering-footer = metadata(<mzt:twoside-numbering-footer>)


#let show-twoside-pagebreak(s, twoside: true) = {
  show metadata.where(value: <mzt:twoside-pagebreak>): pagebreak(
    weak: true,
    to: if twoside {
      "odd"
    },
  )

  show metadata.where(value: <mzt:twoside-emptypage>): [
    #if twoside {
      [ #pagebreak()#[#v(100%)]<mzt:no-header-footer> ]
    }
  ]

  show metadata.where(value: <mzt:twoside-numbering-footer>): [
    #if twoside {
      footer(
        left: numbering => if calc.even(here().page()) {
          numbering
        },
        right: numbering => if not calc.even(here().page()) {
          numbering
        },
      )
    } else {
      footer(center: numbering => numbering)
    }
  ]
  s
}
