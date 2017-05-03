module Validate
  class ArgumentsAreNumbers
    def call(args)
      if args.any? { |arg| letter?(arg) }
        raise BitmapEditorErrors::InvalidArgumentType.new("Argument should have been a number")
      end
    end

    private

    def letter?(string)
      !!(string =~ /[[:alpha:]]/)
    end
  end
end
