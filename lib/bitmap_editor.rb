class BitmapEditor
  # keep this all in one place
  COMMANDS = ["I", "C", "L", "V", "H", "S"].freeze

  attr_reader :bitmap

  def initialize(bitmap_klass = Bitmap, output = $stdout)
    @bitmap_klass = bitmap_klass
    @output = output
  end

  def run(command_string)
    command, *args = command_string.split
    raise BitmapEditorErrors::NoBitmap unless @bitmap || command == "I"
    Validate::Command.new.(command, COMMANDS)

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
