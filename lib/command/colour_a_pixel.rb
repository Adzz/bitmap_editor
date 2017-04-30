module Command
  class ColourAPixel
    COLOUR_RANGE = ("A".."Z").to_a

    def initialize(bitmap, args)
      validate(bitmap, args)
      @bitmap = bitmap
    end

    def execute
      @bitmap.colour_a_pixel(x_coord, y_coord, new_colour)
      @bitmap
    end

    private

    attr_reader :bitmap, :x_coord, :y_coord, :new_colour

    def validate(bitmap, args)
      if args.count != 3
        raise BitmapEditorError::InvalidArgument.new("we need an x and y coordinate and a colour")
      end

      if args[0..1].any? { |arg| letter?(arg) }
        raise BitmapEditorError::InvalidArgument.new("x and y coordinates should be numbers")
      end

      @x_coord = args.first.to_i
      @y_coord = args[1].to_i
      @new_colour = args.last.upcase

      if !COLOUR_RANGE.include?(new_colour)
        raise BitmapEditorError::InvalidArgument.new("colour must be in the colour range")
      end

      if !(Bitmap::BOARD_RANGE.min..bitmap.height).to_a.include?(x_coord) || !(Bitmap::BOARD_RANGE.min..bitmap.width).to_a.include?(y_coord)
        raise BitmapEditorError::InvalidArgument.new("coordinates dont fit on the bitmap")
      end
    end

    def letter?(string)
      string =~ /[[:alpha:]]/
    end
  end
end
