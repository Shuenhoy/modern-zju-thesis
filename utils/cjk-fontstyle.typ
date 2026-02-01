// Orignal source: https://github.com/csimide/cuti
#import "./fonts.typ"

#let fakebold(base-weight: none, s, ..params) = {
  set text(weight: base-weight) if base-weight != none
  set text(..params) if params != ()
  context {
    set text(stroke: 0.02857 * 4 / 3 * text.size + text.fill)
    s
  }
}

#let regex-fakebold(reg-exp: ".", base-weight: none, s, ..params) = {
  show regex(reg-exp): it => {
    fakebold(base-weight: base-weight, it, ..params)
  }
  s
}

#let regex-emph(reg-exp: ".", base-weight: none, s, ..params) = {
  show regex(reg-exp): it => {
    set text(font: fonts.字体.楷体)
    it
  }
  s
}

#let show-cjk-fontstyle(reg-exp: ".", base-weight: none, s, ..params) = {
  show text.where(weight: "bold").or(strong): it => {
    regex-fakebold(reg-exp: reg-exp, base-weight: base-weight, it, ..params)
  }
  show text.where(style: "italic").or(emph): it => {
    regex-emph(reg-exp: reg-exp, base-weight: base-weight, it, ..params)
  }
  s
}

#let cn-fontstyle(s, ..params) = {
  regex-fakebold(reg-exp: "[\p{script=Han}！-･〇-〰—]+", base-weight: "regular", s, ..params)
}

#let show-cn-fontstyle(s, ..params) = {
  show-cjk-fontstyle(reg-exp: "[\p{script=Han}！-･〇-〰—]+", base-weight: "regular", s, ..params)
}
