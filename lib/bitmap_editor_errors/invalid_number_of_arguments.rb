module BitmapEditorErrors
  class InvalidNumberOfArguments < StandardError
    def initialize(message)
      super(message)
    end
  end
end
