module Validate
  class Command
    COMMANDS = [
      "I",
      "C",
      "L",
      "V",
      "H",
      "S"
    ].freeze

    def call(command)
      raise BitmapEditorErrors::UnrecognisedCommand.new unless COMMANDS.include?(command)
    end
  end
end
