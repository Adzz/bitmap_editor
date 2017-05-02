module Command
  class New
    REQUIRED_LENGTH_OF_ARGS = 2

    def initialize(bitmap, args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      Validate::ArgumentsAreNumbers.new.(args[0..-1])
      @width = args[0].to_i
      @height = args[1].to_i

      Validate::Coordinates.new.(@width, @height)
    end

    def execute
      Bitmap.new(@width, @height)
    end
  end
end
