
#let bib-provider(bibsource, mode: "", title-case: false, options: (:)) = {
  let typstbib = bibliography(bytes(bibsource), style: "gb-7714-2015-numeric", title: none)
  let hiddenbib = [
    #show bibliography: none // to provide hint in the editor
    #typstbib
  ]
  if mode == "bilingual" {
    assert(false, "The 'bilingual' mode is deprecated. Please use the 'citext' mode instead.")
  } else if (mode == "citext") {
    import "./citext/lib.typ": *
    let bib = init-citation(bibsource, title-case: title-case)

    (
      bibcontent: extbib(bib, ..options),
      bibshow: show-extcite.with(bib: bib, gen-id: true),
      hiddenbib: hiddenbib,
      new-bib: new-citext-session,
    )
  } else if (mode == "partbib") {
    assert(false, "The 'partbib' mode is deprecated. Please use the 'citext' mode instead.")
  }
}
