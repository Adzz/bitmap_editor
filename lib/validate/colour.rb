module Validate
  class Colour
    COLOUR_RANGE = ("A".."Z").to_a

    def call(colour)
      raise BitmapEditorErrors::InvalidColour.new unless COLOUR_RANGE.include?(colour)
    end
  end
end
