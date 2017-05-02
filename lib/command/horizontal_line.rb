module Command
  class HorizontalLine
    REQUIRED_LENGTH_OF_ARGS = 4

    def initialize(bitmap, args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      Validate::ArgumentsAreNumbers.new.(args[0..-2])
      @start  = [args[0].to_i, args[1].to_i].sort.min
      @finish = [args[0].to_i, args[1].to_i].sort.max
      @row = args[2].to_i
      @colour = args.last.upcase
      @bitmap = bitmap
      Validate::Colour.new.(colour)
    end

    def execute
      start.upto(finish).each do |x_coordinate|
        Validate::Coordinates.new.(x_coordinate, row, bitmap)
        bitmap.colour_a_pixel(x_coordinate, row, colour)
      end
      bitmap
    end

    private

    attr_reader :row, :start, :finish, :colour, :bitmap
  end
end
