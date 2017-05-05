module Command
  class DrawALine
    REQUIRED_LENGTH_OF_ARGS = 4.freeze

    def initialize(bitmap, args, line, subcommand = Command::ColourAPixel)
      Validate::NumberOfArguments.new.(args.length, REQUIRED_LENGTH_OF_ARGS)
      Validate::ArgumentsAreNumbers.new.(args[0..-2])
      @coordinates = line.new(args).coordinates
      @colour = args.last.upcase
      @bitmap = bitmap
      @subcommand = subcommand
    end

    def execute
      coordinates.each do |coordinate|
    # validation of the line fitting on the bitmap can happen when it's actually drawn
        subcommand.new(bitmap, [coordinate[0], coordinate[1], colour]).execute
      end
      bitmap
    end

    private

    attr_reader :colour, :bitmap, :subcommand, :coordinates
  end
end
