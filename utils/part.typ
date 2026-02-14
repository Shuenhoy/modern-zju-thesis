#import "./fonts.typ": 字号, 字体
#import "./twoside.typ": *
#let part = figure.with(
  kind: "part",
  // same as heading
  numbering: "第一部分",
  // this cannot use auto to translate this automatically as headings can, auto also means something different for figures
  supplement: "Part",
  // empty caption required to be included in outline
  caption: [],
)


#let show-part(s) = {

  // emulate element function by creating show rule
  show figure.where(kind: "part"): it => {
    twoside-pagebreak
    counter(heading).update(0)
    if it.numbering != none {
      [
        #v(0.1fr)
        #set align(center)
        #set text(font: 字体.黑体, size: 48pt)
        #strong(it.counter.display(it.numbering))<mzt:no-header-footer>

        #set text(font: 字体.仿宋, size: 字号.小初)
        #strong(it.body)
        #v(0.2fr)
      ]
    }

    twoside-emptypage
    counter(page).update(0)
  }
  s
}

#let show-outline-with-part(s) = {
  show outline.entry: it => {
    if it.element.func() == figure {
      // we're configuring chapter printing here, effectively recreating the default show impl with slight tweaks
      let res = link(
        it.element.location(),
        // we must recreate part of the show rule from above once again
        if it.element.numbering != none {
          numbering(it.element.numbering, ..it.element.counter.at(it.element.location()))
        }
          + [ ]
          + it.element.body,
      )
      set par(first-line-indent: 0em)

      text(size: 字号.三号, weight: "bold", res)
    } else {
      it
    }
  }
  s
}


#let part-and-headings = figure.where(kind: "part", outlined: true).or(heading.where(outlined: true))