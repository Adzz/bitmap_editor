module Validate
  class NumberOfArguments
    def call(args_given, required_number_of_args)
      if args_given != required_number_of_args
        raise BitmapEditorErrors::InvalidNumberOfArguments.new(
          "#{args_given} args given, required #{required_number_of_args}"
        )
      end
    end
  end
end
