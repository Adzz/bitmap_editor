class BitmapEditor
  attr_reader :bitmap

  def initialize(bitmapKlass = BitmapKlass)
    @bitmapKlass = bitmapKlass
  end

  def run(command_string)
    command, *args = command_string.split
    case command
    when 'I'
      @bitmap = bitmapKlass.new(args)
    when 'C'
      raise BitmapEditorError::NoBitmap unless @bitmap
      @bitmap = bitmapKlass.new(["#{bitmap.width}", "#{bitmap.height}"])
    when 'S'
        puts "There is no image"
    else
        puts 'unrecognised command :('
    end
  end

 private

  attr_reader :bitmapKlass
end
