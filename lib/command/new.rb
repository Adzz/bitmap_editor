module Command
  class New
    REQUIRED_LENGTH_OF_ARGS = 2.freeze

    def initialize(args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      Validate::ArgumentsAreNumbers.new.(args[0..-1])
      @width = args.fetch(0).to_i
      @height = args.fetch(1).to_i

      Validate::Coordinates.new.(@width, @height)
    end

    def execute
      Bitmap.new(@width, @height)
    end
  end
end
