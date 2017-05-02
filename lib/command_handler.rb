class CommandHandler
  COMMANDS = {
    "I" => Commands::New,
    "C" => Commands::Clear,
    "L" => Commands::ColourAPixel,
    "H" => Commands::HorizontalLine,
    "V" => Command::VerticalLine,
    "S" => Command::Show,
  }

  def execute(command, args, bitmap)
    COMMANDS[command].new(bitmap, args).execute
  end

  private

  attr_reader :bitmap
end
