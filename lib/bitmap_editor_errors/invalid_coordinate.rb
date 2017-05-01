module BitmapEditorErrors
  class InvalidCoordinate < StandardError
    def initialize(msg="One or more coordinates are outside the bounds of the bitmap")
      super
    end
  end
end
