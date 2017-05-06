module Validate
  class Command
    def call(command, commands)
      raise BitmapEditorErrors::UnrecognisedCommand.new unless commands.include?(command)
    end
  end
end
