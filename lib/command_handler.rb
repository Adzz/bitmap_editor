class CommandHandler
  COMMANDS = {
    "L" => Command::ColourAPixel,
  }

  def initialize(bitmap)
    @bitmap = bitmap
  end

  def execute(command, args)
    COMMANDS[command].new(args)
  end
end
