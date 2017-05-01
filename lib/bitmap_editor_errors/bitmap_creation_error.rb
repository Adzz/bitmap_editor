module BitmapEditorErrors
  class BitmapCreationError < StandardError
    def initialize(msg="Bitmaps need a Height AND Width!")
      super
    end
  end
end
