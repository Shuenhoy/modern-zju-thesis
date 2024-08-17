#import "./fonts.typ": 字号, 字体

#let part = figure.with(
  kind: "part",
  // same as heading
  numbering: "第一部分",
  // this cannot use auto to translate this automatically as headings can, auto also means something different for figures
  supplement: "Part",
  // empty caption required to be included in outline
  caption: []
)

#let part-refs = state("part-refs", ())

#let show-part-ref(s) = {
  show ref: it => {
    if it.element != none {
      // Citing a document element like a figure, not a bib key
      // So don't update refs
      it
      return
    }
    part-refs.update(old => {
      if it.target not in old {
        old.push(it.target)
      }
      old
    })

    //I think the following is how the reference index should be obtained correctly.

    let get_ref_id(loc) = {
      //str(part-refs.at(loc).len())
      str(part-refs.at(loc).position(x => (x == it.target)) + 1)
    }


    locate(loc => {
      "[" + get_ref_id(loc) + "]"
    })
  }
  s
}

#let new-part-ref() = {
  part-ref.update()
}

#let show-part(s) = {
  show: show-part-ref

  // emulate element function by creating show rule
  show figure.where(kind: "part"): it => {
    pagebreak()
    counter(heading).update(0)
    counter(page).update(0)
    if it.numbering != none {
      [
        #v(0.1fr)
        #set align(center)
        #set text(font: 字体.黑体, size: 48pt)
        #strong(it.counter.display(it.numbering))<no-header>

        #set text(font: 字体.仿宋, size: 字号.小初)
        #strong(it.body)
        #v(0.2fr)
      ]
    }

    pagebreak()
  }
  s
}

#let show-outline(s) = {

  show outline.entry: it => {
    if it.element.func() == figure {
      // we're configuring chapter printing here, effectively recreating the default show impl with slight tweaks
      let res = link(it.element.location(),
      // we must recreate part of the show rule from above once again
      if it.element.numbering != none {
        numbering(it.element.numbering, ..it.element.counter.at(it.element.location()))
      } + [ ] + it.element.body
    )

      text(size: 字号.三号, weight: "bold", res)
    } else {
      // we're doing indenting here
      h(1.5em * (it.level - 1)) + it
    }
  }
  s
}

#let part-bib = {
  locate(loc => {
    //https://github.com/typst/typst/issues/1097

    let ref-counter = counter("part-refs")
    ref-counter.update(1)
    show regex("^\[(\d+)\]\s"): it => [
      [#ref-counter.display()]
    ]
    for target in part-refs.at(loc) {
      block(cite(target, form: "full"))
      ref-counter.step()
    }
    part-refs.update(())
  })
}

#let chapters-and-headings = figure.where(kind: "part", outlined: true).or(heading.where(outlined: true))