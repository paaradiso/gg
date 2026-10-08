import gg/chart.{type Chart}
import gg/color
import gg/shape.{type Shape, Rect}
import gleam/list

@external(javascript, "./canvas_ffi.mjs", "clear_canvas")
fn clear_canvas(canvas_id: String) -> Nil

@external(javascript, "./canvas_ffi.mjs", "draw_rect")
fn ffi_draw_rect(
  canvas_id: String,
  x: Float,
  y: Float,
  width: Float,
  height: Float,
  color_css: String,
) -> Nil

pub fn draw_shape(canvas_id: String, shape: Shape) -> Nil {
  case shape {
    Rect(x, y, width, height, color) ->
      ffi_draw_rect(canvas_id, x, y, width, height, color.to_css_string(color))
  }
}

@external(javascript, "./canvas_ffi.mjs", "request_animation_frame")
fn request_animation_frame(callback: fn() -> Nil) -> Nil

pub fn draw_chart(canvas_id: String, c: Chart) -> Nil {
  request_animation_frame(fn() {
    clear_canvas(canvas_id)
    c.shapes
    |> list.reverse
    |> list.each(fn(shape) { draw_shape(canvas_id, shape) })
  })
}
