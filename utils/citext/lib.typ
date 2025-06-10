#import "@preview/ctxjs:0.3.1"
#import "@preview/mitex:0.2.4": mi


#let cite-src = read("./dist/index.bin", encoding: none)


#let gb-t-7714-2015-numeric-bilingual = read("gb-t-7714-2015-numeric-bilingual.csl")
#let locales-zh-CN = read("locales-zh-CN.xml")

#let simple-split(bs) = {
  str.split("\n" + bs, "\n@").map(str.trim).filter(it => it != "").map(it => "@" + it)
  // for each element x, first line must be @<type>{<key>,
  // make a dict with key as key and value as x
}

#let init-citation(bib, csl: gb-t-7714-2015-numeric-bilingual, locales: locales-zh-CN, mode: "lazy") = {
  let ctx = ctxjs.new-context(
    load: (
      ctxjs.load.load-module-bytecode(cite-src),
      ctxjs.load.call-module-function("citext", "initConfig", (gb-t-7714-2015-numeric-bilingual, locales-zh-CN)),
    ),
  )

  if mode == "stable" {
    let cites = ctxjs.ctx.call-module-function(ctx, "citext", "citex", (bib.replace("$", "\\$"),))

    (
      get: id => cites.at(id),
    )
  } else {
    let bibs = simple-split(bib.replace("$", "\\$"))

    if mode == "lazy" {
      let bibs = bibs
        .map(x => {
          let key = str.split(x, "{").at(1).split(",").at(0)
          (key.trim(), x)
        })
        .to-dict()

      (
        get: id => {
          let v = bibs.at(str(id))
          ctxjs.ctx.call-module-function(ctx, "citext", "citeone", (v,)).at(1)
        },
      )
    } else if mode == "eager" {
      let cites = bibs
        .map(v => {
          ctxjs.ctx.call-module-function(ctx, "citext", "citeone", (v,))
        })
        .to-dict()
      (
        get: id => cites.at(str(id)),
      )
    }
  }
}


#let extcitefull(bib, id) = {
  show regex("\$.+?\$"): it => mi(it)
  (bib.get)(id).at("bibliography")
}
#let citeauthor-one-two-more(authors, ETAL: none, AND: none) = {
  let len = authors.len()
  if len > 2 {
    return authors.at(0).family + ETAL
  } else if len == 2 {
    return authors.at(0).family + AND + authors.at(1).family
  } else {
    return authors.at(0).family
  }
}
#let en-US-citeauthor = citeauthor-one-two-more.with(AND: " and ", ETAL: " et al.")
#let zh-CN-citeauthor = citeauthor-one-two-more.with(AND: "和", ETAL: "等")

#let extciteauthor(
  bib,
  id,
  mapping: (
    en-US: zh-CN-citeauthor,
    zh-CN: zh-CN-citeauthor,
  ),
) = {
  let entry = (bib.get)(id)
  mapping.at(entry.at("language"), default: mapping.en-US)(entry.at("author"))
}

#let cite-targets = state("cite-targets", ())
#let new-citext-session() = {
  cite-targets.update(())
}

#let get-ref-id(key, loc) = {
  str(cite-targets.at(loc).position(x => x == key) + 1)
}


#let show-extcite(s, bib: (:), gen-id: false) = {
  let updatecite(key) = {
    cite-targets.update(old => {
      if key not in old {
        old.push(key)
      }
      old
    })
  }
  let numeric-cite(key) = {
    updatecite(key)
    if gen-id {
      context {
        super("[" + get-ref-id(key, here()) + "]")
      }
    } else {
      it
    }
  }
  show ref: it => {
    if it.element != none {
      // Citing a document element like a figure, not a bib key
      // So don't update refs
      it
      return
    }
    numeric-cite(it.target)
  }

  show cite.where(form: "normal"): it => {
    numeric-cite(it.key)
  }

  show ref.where(label: <citea>): it => {
    extciteauthor(bib, str(it.target))
  }
  show cite.where(form: "author"): it => {
    extciteauthor(bib, str(it.key))
  }

  show ref.where(label: <citey>): it => {
    cite(it.target, form: "year")
  }

  show ref.where(label: <citep>): it => {
    [#extciteauthor(bib, str(it.target)) #cite(it.target)]
  }

  show cite.where(form: "prose"): it => {
    [#extciteauthor(bib, str(it.key)) #cite(it.key)]
  }

  show ref.where(label: <citet>): it => {
    show super: it => it.body
    [#extciteauthor(bib, str(it.target)) #cite(it.target)]
  }

  show ref.where(label: <citef>): it => {
    [#footnote[#extcitefull(bib, str(it.target))]]
  }

  show cite.where(form: "full"): it => {
    extcitefull(bib, str(it.key))
  }
  s
}



#let extbib(bib, row-gutter: 1.2em) = {
  context {
    grid(
      columns: 2,
      column-gutter: 0.65em,
      row-gutter: row-gutter,
      ..cite-targets
        .at(here())
        .enumerate()
        .map(x => {
          let i = x.at(0) + 1
          let target = x.at(1)
          ([\[#i\]], extcitefull(bib, str(target)))
        })
        .flatten()
    )
  }
}
