class BitmapEditor
  attr_reader :bitmaps

  def initialize
    @bitmaps = []
  end

  def run(command_string)
    command, *args = command_string.split
    case command
    when 'I'
      bitmaps << Bitmap.new(args)
    when 'S'
        puts "There is no image"
    else
        puts 'unrecognised command :('
    end
  end
end
