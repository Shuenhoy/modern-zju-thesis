// https://github.com/typst/typst/issues/1295#issuecomment-2749005636

#let in-outline = state("in-outline", false)
#let show-flex-caption(c) = {
  show outline: it => {
    in-outline.update(true)
    it
    in-outline.update(false)
  }
  c
}
#let flex-caption(short: none, long: none) = context if state("in-outline", false).get() {
  short
} else { long }
