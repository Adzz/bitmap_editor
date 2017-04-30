class Bitmap
  attr_reader :height, :width, :image

  BOARD_RANGE = (1..250).to_a

  def initialize(args, default_color = "O")
    validate_args(args)
    @default_color = default_color
    @image = Array.new(height) { Array.new(width, default_color) }
  end

  def to_s
    image.map(&:join).join("\n")
  end

  # def to_hash
  #   image.map.with_index.with_object({}) do |(line, index), obj|
  #     obj[index + 1] = line
  #   end
  # end

  def colour_a_pixel(x, y, colour)
    @image[(x - 1)][(y - 1)] = colour
    @image
  end

  private

  attr_reader :default_color

  def validate_args(args)
    raise BitmapEditorError::BitmapCreationError unless args.count == 2
    if args.any? { |arg| letter?(arg) }
      raise BitmapEditorError::BitmapCreationError, "Height and Width must be numbers"
    end

    @width = args.first.to_i
    @height = args[1].to_i

    if !BOARD_RANGE.include?(height) || !BOARD_RANGE.include?(width)
      raise BitmapEditorError::BitmapCreationError, "Height and Width must be between #{BOARD_RANGE.min} and #{BOARD_RANGE.max}"
    end
  end

  def letter?(string)
    string =~ /[[:alpha:]]/
  end
end
