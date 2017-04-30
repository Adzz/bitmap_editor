class Bitmap
  attr_reader :height, :width

  def initialize(args, default_color = "O")
    validate_args(args)
    @default_color = default_color
  end

  def image
    @image ||= Array.new(height, Array.new(width, default_color))
  end

  private

  attr_reader :default_color

  def validate_args(args)
    raise BitmapEditorErrors::BitmapCreationError unless args.count == 2
    if args.any? { |arg| letter?(arg) }
      raise BitmapEditorErrors::BitmapCreationError, "Height and Width must be numbers"
    end
    @width = args.first.to_i
    @height = args[1].to_i
  end

  def letter?(string)
    string =~ /[[:alpha:]]/
  end
end
