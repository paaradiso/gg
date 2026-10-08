import gg/color.{type Color}
import gg/shape.{type Shape, Rect}

pub type Chart {
  Chart(width: Float, height: Float, shapes: List(Shape))
}

pub fn create(width: Float, height: Float, shapes: List(Shape)) -> Chart {
  Chart(width:, height:, shapes:)
}

pub fn add_rect(
  chart: Chart,
  x: Float,
  y: Float,
  width: Float,
  height: Float,
  color: Color,
) -> Chart {
  Chart(..chart, shapes: [
    Rect(x: x, y: y, width: width, height: height, color: color),
    ..chart.shapes
  ])
}
