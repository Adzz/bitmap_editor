class BitmapEditorError::InvalidArgument < StandardError
  def initialize(description)
    super("Invalid argument: #{description}")
  end
end
