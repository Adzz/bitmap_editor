class Bitmap
  attr_reader :height, :width, :image
  DEFAULT_COLOR = "O".freeze

  def initialize(width, height)
    @width = width
    @height = height
    @image = Array.new(height) { Array.new(width) { DEFAULT_COLOR } }
  end

  def to_s
    image.map(&:join).join("\n")
  end

  def colour_a_pixel(x, y, colour)
    x -= 1
    y -= 1
    # maybe I'm a worrier
    error = BitmapEditorErrors::InvalidCoordinate.new
    image.fetch(y) { raise error }.fetch(x) { raise error }
    image[y][x] = colour
    image
  end
end
