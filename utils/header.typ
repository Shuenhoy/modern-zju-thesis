#import "./fonts.typ": 字号, 字体

#let header(
  stroke: 0.5pt,
  spacing: 0.5em,
  font: 字体.宋体,
  size: 字号.小五,
  left: none,
  right: none,
  center: none,
) = {
  set text(font: font, size: size)
  locate(loc => {
    if not (query(<mzt:no-header-footer>, loc).filter(el => el.location().page() == loc.page()) != ()) {
      stack(
        spacing: spacing,
        grid(
          columns: (1fr, 1fr, 1fr),
          align: (alignment.left, alignment.center, alignment.right),
          left, center, right,
        ),
        line(length: 100%, stroke: stroke),
      )
    }

  })
}

#let footer(left: none, right: none, center: none) = locate(loc => {
  if not (query(<mzt:no-header-footer>, loc).filter(el => el.location().page() == loc.page()) != ()) {
    let fleft(numbering) = {
      if type(left) == function {
        left(numbering)
      } else {
        left
      }
    }
    let fcenter(numbering) = {
      if type(center) == function {
        center(numbering)
      } else {
        center
      }
    }
    let fright(numbering) = {
      if type(right) == function {
        right(numbering)
      } else {
        right
      }
    }
    context [
      #set text(字号.小五)
      #let page-numbering = page.numbering
      #if page-numbering == none {
        page-numbering = "1"
      }
      #let numbering = counter(page).display(page-numbering)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (alignment.left, alignment.center, alignment.right),
        fleft(numbering), fcenter(numbering), fright(numbering),
      )
    ]
  }
})