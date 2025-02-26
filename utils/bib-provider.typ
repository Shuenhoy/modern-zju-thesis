
#let bib-provider(bibsource, mode: "") = {
  let typstbib = bibliography(bytes(bibsource), style: "gb-7714-2015-numeric", title: none)
  let hiddenbib = [
    #show bibliography: none // to provide hint in the editor
    #typstbib
  ]
  if mode == "bilingual" {
    import "./bilingual-bibliography.typ": show-bilingual-bibliography

    (
      bibcontent: typstbib,
      bibshow: show-bilingual-bibliography,
      hiddenbib: none,
      new-bib: () => (),
    )
  } else if (mode == "citext") {
    import "./citext/lib.typ": *
    let bib = init-citation(bibsource)

    (
      bibcontent: extbib(bib),
      bibshow: show-extcite.with(bib: bib, gen-id: true),
      hiddenbib: hiddenbib,
      new-bib: new-citext-session,
    )
  } else if (mode == "partbib") {
    import "./part.typ": *
    (
      bibcontent: part-bib,
      bibshow: x => x,
      hiddenbib: hiddenbib,
      new-bib: () => part-refs.update(()),
    )
  }
}
