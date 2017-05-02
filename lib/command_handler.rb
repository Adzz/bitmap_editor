class CommandHandler
  COMMANDS = {
    "I" => Commands::New,
    "C" => Commands::Clear,
    "L" => Commands::ColourAPixel,
    "H" => Commands::HorizontalLine,
    "V" => Commands::VerticalLine,
    "S" => Commands::Show,
  }

  def run_command(bitmap, command, args)
    COMMANDS[command].new(bitmap, args).execute
  end

  private

  attr_reader :bitmap
end
