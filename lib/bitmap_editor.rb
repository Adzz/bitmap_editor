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
    @bitmap = CommandHandler.new.execute(command, args)
  end

 private

  attr_reader :bitmap_klass, :validator
end
