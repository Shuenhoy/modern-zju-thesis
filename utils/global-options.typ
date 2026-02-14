#let get-opt(key, default: none) = {
  if key in sys.inputs.keys() {
    json(bytes(sys.inputs.at(key)))
  } else {
    default
  }
}


#let debug-fakebold = get-opt("mzt-debug-fakebold", default: false)
#let experimental-modern-fonts = get-opt("mzt-experimental-modern-fonts", default: false)
#let experimental-finetune-cjk-baseline = get-opt("mzt-experimental-finetune-cjk-baseline", default: false)
