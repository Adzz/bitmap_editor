module Commands
  class HorizontalLine
    REQUIRED_LENGTH_OF_ARGS = 4

    def initialize(bitmap, args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      Validate::ArgumentsAreNumbers.new.(args[0..-2])
      @start  = [args[1].to_i, args[2].to_i].sort.min
      @finish = [args[1].to_i, args[2].to_i].sort.max
      @column = args[0].to_i
      @colour = args.last.upcase
      @bitmap = bitmap
      Validate::Colour.new.(colour)
    end

    def execute
      start.upto(finish).each do |y_coordinate|
        Validate::Coordinates.new(column, y_coordinate, bitmap)
        bitmap.colour_a_pixel(column, y_coordinate, colour)
      end
      bitmap
    end

    private

    attr_reader :column, :start, :finish, :colour, :bitmap
  end
end
