# validators
require_relative './validate/command.rb'
# commands
require_relative './command/new.rb'
require_relative './command/clear.rb'
require_relative './command/colour_a_pixel.rb'
require_relative './command/line/horizontal_line.rb'
require_relative './command/line/vertical_line.rb'
require_relative './command/draw_a_line.rb'
require_relative './command/show.rb'


class BitmapEditor
  attr_reader :bitmap

  def initialize(bitmap_klass = Bitmap)
    @bitmap_klass = bitmap_klass
  end

  def run(command_string)
    command, *args = command_string.split

    raise BitmapEditorErrors::NoBitmap unless @bitmap || command == "I"

    Validate::Command.new.(command)

    case command.upcase
    when 'I'
      @bitmap = Command::New.new(args).execute
    when 'C'
      @bitmap = Command::Clear.new.new(bitmap).execute
    when "L"
      @bitmap = Command::ColourAPixel.new(bitmap, args).execute
    when "H"
      @bitmap = Command::DrawALine.new(bitmap, args, HorizontalLine).execute
    when "V"
      @bitmap = Command::DrawALine.new(bitmap, args, VerticalLine).execute
    when "S"
      Command::Show.new(bitmap).execute
    end
  end

  private

  attr_reader :bitmap_klass
end
