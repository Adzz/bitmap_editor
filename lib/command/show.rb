module Command
  class Show
    REQUIRED_LENGTH_OF_ARGS = 0

    def initialize(bitmap, args)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      @bitmap = bitmap
    end

    def execute
      puts @bitmap
    end
  end
end
