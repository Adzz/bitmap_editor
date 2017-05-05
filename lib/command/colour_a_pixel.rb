module Command
  class ColourAPixel
    REQUIRED_LENGTH_OF_ARGS = 3.freeze

    def initialize(bitmap, args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      Validate::ArgumentsAreNumbers.new.(args[0..-2])
      @x_coord = args.fetch(0).to_i
      @y_coord = args.fetch(1).to_i
      @colour = args.fetch(2).upcase
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
