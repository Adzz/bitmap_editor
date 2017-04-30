class BitmapEditorError::NoBitmap < StandardError
  def initialize(msg="There's no bitmap to edit! We need to make one first")
    super
  end
end
