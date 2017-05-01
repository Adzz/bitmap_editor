module BitmapEditorErrors
  class InvalidColour < StandardError
    def initialize
      super("Colour is invalid :(")
    end
  end
end
