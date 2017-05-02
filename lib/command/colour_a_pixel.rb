module Command
  class ColourAPixel
    REQUIRED_LENGTH_OF_ARGS = 3

    def initialize(bitmap, args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      Validate::ArgumentsAreNumbers.new.(args[0..-2])
      @x_coord = args.first.to_i
      @y_coord = args[1].to_i
      @colour = args.last.upcase
      @bitmap = bitmap
      Validate::Colour.new.(colour)
      Validate::Coordinates.new.(x_coord, y_coord, bitmap)
    end

    def execute
      bitmap.colour_a_pixel(x_coord, y_coord, colour)
      bitmap
    end

    private

    attr_reader :bitmap, :x_coord, :y_coord, :colour
  end
end
