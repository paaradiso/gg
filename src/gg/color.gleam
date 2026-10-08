import gleam/int

pub type Color {
  Rgb(r: Int, g: Int, b: Int)
  Hex(hex: String)
}

pub fn to_css_string(color: Color) -> String {
  case color {
    Hex(hex) -> hex
    Rgb(r, g, b) ->
      "rgb("
      <> int.to_string(r)
      <> ", "
      <> int.to_string(g)
      <> ", "
      <> int.to_string(b)
      <> ")"
  }
}
