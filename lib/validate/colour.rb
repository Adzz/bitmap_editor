module Validate
  class Colour
    COLOUR_RANGE = ("A".."Z").to_a.freeze

    def call(colour)
      raise BitmapEditorErrors::InvalidColour.new unless COLOUR_RANGE.include?(colour)
    end
  end
end
