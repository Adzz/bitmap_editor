module Validators
  class ArgumentValidator
    COMMANDS = {
      "I" => 2,
      "C" => 0,
      "L" => 3,
      "V" => 4,
      "H" => 4,
      "S" => 0
    }

    COLOUR_RANGE = ("A".."Z").to_a

    def call(command, args)
      raise BitmapEditorErrors::UnrecognisedCommand.new unless COMMANDS.keys.include?(command)
      raise BitmapEditorErrors::InvalidArgument.new("#{command}") if COMMANDS[command] != args.length
      raise BitmapEditorErrors::InvalidColour.new unless COLOUR_RANGE.include?(args.last)
      if args[0..-2].any? { |arg| letter?(arg) }
        raise BitmapEditorErrors::InvalidCoordinate.new("Coordinates should be numbers")
      end
    end

    private

    def letter?(string)
      string =~ /[[:alpha:]]/
    end
  end
end
