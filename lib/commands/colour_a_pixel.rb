module Commands
  class ColourAPixel
    def initialize(bitmap, args)
      @x_coord = args.first.to_i
      @y_coord = args[1].to_i
      @new_colour = args.last.upcase
      @bitmap = bitmap
      Validators::CoordinateValidator.new.(@x_coord, @y_coord, bitmap)
    end

    def execute
      bitmap.colour_a_pixel(x_coord, y_coord, new_colour)
      bitmap
    end

    private
    attr_reader :bitmap, :x_coord, :y_coord, :new_colour
  end
end
