module BitmapEditorErrors
  class NoBitmap < StandardError
    def initialize(msg="There's no bitmap! We need to make one first")
      super
    end
  end
end
