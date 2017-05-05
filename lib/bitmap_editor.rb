# Exceptions
require './lib/bitmap_editor_errors/bitmap_creation_error'
require './lib/bitmap_editor_errors/no_bitmap'
require './lib/bitmap_editor_errors/invalid_number_of_arguments'
require './lib/bitmap_editor_errors/invalid_colour'
require './lib/bitmap_editor_errors/invalid_coordinate'
require './lib/bitmap_editor_errors/unrecognised_command'

# Lib
require './lib/bitmap_editor'
require './lib/bitmap'

# commands
require './lib/command/new.rb'
require './lib/command/clear'
require './lib/command/colour_a_pixel'
require './lib/command/line/horizontal_line'
require './lib/command/line/vertical_line'
require './lib/command/show'
require './lib/command/draw_a_line'

# Validators
require './lib/validate/arguments_are_numbers'
require './lib/validate/colour'
require './lib/validate/command'
require './lib/validate/coordinates'
require './lib/validate/number_of_arguments'


class BitmapEditor
  attr_reader :bitmap

  def initialize(bitmap_klass = Bitmap, output = $stdout)
    @bitmap_klass = bitmap_klass
    @output = output
  end

  def run(command_string)
    command, *args = command_string.split
    raise BitmapEditorErrors::NoBitmap unless @bitmap || command == "I"
    Validate::Command.new.(command)

    case command.upcase
    when 'I'
      @bitmap = Command::New.new(args).execute
    when 'C'
      @bitmap = Command::Clear.new(bitmap).execute
    when "L"
      @bitmap = Command::ColourAPixel.new(bitmap, args).execute
    when "H"
      @bitmap = Command::DrawALine.new(bitmap, args, HorizontalLine).execute
    when "V"
      @bitmap = Command::DrawALine.new(bitmap, args, VerticalLine).execute
    when "S"
      Command::Show.new(bitmap, @output).execute
    end
  end

  private

  attr_reader :bitmap_klass
end
