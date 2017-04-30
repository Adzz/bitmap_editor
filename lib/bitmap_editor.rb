class BitmapEditor
  attr_reader :bitmap

  def initialize(bitmap_klass = Bitmap, color_a_pixel = Command::ColourAPixel)
    @bitmap_klass = bitmap_klass
    @colour_a_pixel = color_a_pixel
  end

  def run(command_string)
    command, *args = command_string.split

    # CommandHandler.new.execute(command, args)
    case command
    when 'I'
      # each of the command classes can be passed a bitmap,
      # the command creates a new bitmap with the changes
      # this gets assigned to the bitmap_editor.bitmap
      @bitmap = bitmap_klass.new(args)
    when 'C'
      raise BitmapEditorError::NoBitmap unless @bitmap
      @bitmap = bitmap_klass.new(["#{bitmap.width}", "#{bitmap.height}"])
    when 'L'
      raise BitmapEditorError::NoBitmap unless @bitmap
      @bitmap = colour_a_pixel.new(bitmap, args).execute
    when 'S'
      raise BitmapEditorError::NoBitmap unless @bitmap
      puts bitmap
    else
      puts 'unrecognised command :('
    end
  end

 private

  attr_reader :bitmap_klass, :colour_a_pixel
end
