require_relative './command/new.rb'
require_relative './command/clear.rb'
require_relative './command/colour_a_pixel.rb'
require_relative './command/line/horizontal_line.rb'
require_relative './command/line/vertical_line.rb'
require_relative './command/draw_a_line.rb'
require_relative './command/show.rb'

class CommandHandler
  COMMANDS = {
    "I" => Command::New,
    "C" => Command::Clear,
    "L" => Command::ColourAPixel,
    "H" => Command::DrawALine,
    "V" => Command::DrawALine,
    "S" => Command::Show,
  }

  def run_command(bitmap, command, args)
    COMMANDS[command].new(bitmap, args).execute
  end

  private

  attr_reader :bitmap
end
