require_relative './validate/command.rb'

class BitmapEditor
  attr_reader :bitmap

  def initialize(bitmap_klass = Bitmap)
    @bitmap_klass = bitmap_klass
  end

  def run(command_string)
    command, *args = command_string.split
    raise BitmapEditorErrors::NoBitmap unless @bitmap || command == "I"
    Validate::Command.new.(command)
    result = CommandHandler.new.run_command(@bitmap, command, args)
    @bitmap = result
  end

  private
  attr_reader :bitmap_klass, :validator
end
