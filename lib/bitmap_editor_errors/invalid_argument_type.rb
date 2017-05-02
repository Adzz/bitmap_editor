module BitmapEditorErrors
  class InvalidArgumentType < StandardError
    def initialize(message)
      super(message)
    end
  end
end
