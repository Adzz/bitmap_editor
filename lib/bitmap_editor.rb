class BitmapEditor
  attr_reader :bitmap

  def initialize(bitmap_klass = Bitmap, validator = ArgumentValidator)
    @bitmap_klass = bitmap_klass
    @validator = validator
  end

  def run(command_string)
    command, *args = command_string.split
    raise BitmapEditorErrors::NoBitmap unless @bitmap || command == "I"
    validator.new.(command, args)

    # CommandHandler.new.execute(command_string, args)

    case command
    when 'I'
      @bitmap = bitmap_klass.new(args)
    when 'C'
      @bitmap = bitmap_klass.new(["#{bitmap.width}", "#{bitmap.height}"])
    when 'L'
      @bitmap = Commands::ColourAPixel.new(bitmap, args).execute
    when 'H'
      @bitmap = Commands::HorizontalLine.new(bitmap, args).execute
    when 'S'
      puts bitmap
    else
      puts 'unrecognised command :('
    end
  end

 private

  attr_reader :bitmap_klass, :validator
end
