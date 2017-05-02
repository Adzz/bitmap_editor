module Commands
  class Clear
    REQUIRED_LENGTH_OF_ARGS = 0

    def initialize(bitmap, args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      @width = bitmap.width
      @height = bitmap.height
    end

    def execute
      Bitmap.new(width, height)
    end
  end
end
