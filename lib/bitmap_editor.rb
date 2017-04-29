class BitmapEditor
  attr_reader :bitmaps

  def initialize(bitmap = Bitmap)
    @bitmap = bitmap
    @bitmaps = []
  end

  def run(command_string)
    command, *args = command_string.split
    case command
    when 'I'
      bitmaps << bitmap.new(args)
    when 'S'
        puts "There is no image"
    else
        puts 'unrecognised command :('
    end
  end

  private

  attr_reader :bitmap
end
