// Orignal source: https://github.com/csimide/cuti
#import "./fonts.typ"
#import "./global-options.typ": debug-fakebold, experimental-finetune-cjk-baseline, experimental-modern-fonts

#let fakebold(stroke: auto, base-weight: none, s, ..params) = {
  let t-weight = if base-weight == auto { weight } else { base-weight }
  assert(
    t-weight in (auto, none) or type(t-weight) in (str, int),
    message: "`base-weight`/`weight` should be `auto`, `none`, `int` or `str` type.",
  )
  assert(
    stroke == auto or type(stroke) in (std.stroke, length),
    message: "`stroke` shoule be `auto`, `length` or `stroke` type.",
  )

  set text(weight: t-weight) if type(t-weight) in (str, int)
  set text(weight: "regular") if t-weight == none
  set text(..params) if params != ()

  context {
    let t-stroke = if stroke == auto {
      0.02857em * 4 / 3 + text.fill
    } else if type(stroke) == length {
      stroke + text.fill
    } else {
      stroke
    }

    if debug-fakebold {
      set text(stroke: 0.02857em * 4 / 3 + color.red)
      s
    } else {
      set text(stroke: t-stroke)
      s
    }
  }
}

#let regex-fakebold(reg-exp: ".", base-weight: none, s, ..params) = {
  context {
    if text.font.last() in fonts.fakebold-fonts {
      show regex(reg-exp): it => {
        fakebold(base-weight: base-weight, it, ..params)
      }
      s
    } else {
      s
    }
  }
}

#let regex-emph(reg-exp: ".", base-weight: none, s, ..params) = {
  show regex("\p{Hani}"): it => {
    box[#it#box(place(circle(fill: black, width: 0.12em), dx: -0.55em, dy: 0.2em))]
  }
  s
}

#let show-cjk-fontstyle(reg-exp: ".", base-weight: none, s, ..params) = {
  context {
    let old-baseline = text.baseline
    show text.where(weight: "bold").or(strong): it => {
      regex-fakebold(reg-exp: reg-exp, base-weight: base-weight, it, ..params)
    }
    show text.where(style: "italic").or(emph): it => {
      regex-emph(reg-exp: reg-exp, base-weight: base-weight, it, ..params)
    }

    if experimental-finetune-cjk-baseline {
      show regex(reg-exp): set text(baseline: old-baseline + 0.07em)
      s
    } else {
      s
    }
  }
}

#let cn-fontstyle(s, ..params) = {
  regex-fakebold(reg-exp: "[\p{script=Han}！-･〇-〰—]+", base-weight: "regular", s, ..params)
}

#let show-cn-fontstyle(s, ..params) = {
  show-cjk-fontstyle(reg-exp: "[\p{script=Han}！-･〇-〰—]+", base-weight: "regular", s, ..params)
}
