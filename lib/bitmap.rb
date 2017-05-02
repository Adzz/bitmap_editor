class Bitmap
  attr_reader :height, :width, :image
  DEFAULT_COLOR = "O"

  def initialize(width, height)
    @width = width
    @height = height
    @image = Array.new(height) { Array.new(width, DEFAULT_COLOR) }
  end

  def to_s
    image.map(&:join).join("\n")
  end

  def colour_a_pixel(x, y, colour)
    # arrays are 0 indexed, our bitmap is not
    image[(x - 1)][(y - 1)] = colour
  end
end
