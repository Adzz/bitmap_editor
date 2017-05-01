module Commands
  class HorizontalLine
    def initialize(bitmap, args, color_a_pixel = Command::ColourAPixel)
      @row = args.first.to_i
      @start = args[1].to_i
      @finish = args[2].to_i

      @new_colour = args.last.upcase
      @bitmap = bitmap
      @color_a_pixel = color_a_pixel
    end

    def execute
    end

    private

    attr_reader :row, :start, :finish, :new_colour

    def validate(bitmap, args)
    end
  end
end
