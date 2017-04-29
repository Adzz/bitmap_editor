class Bitmap
  def initialize(args)
    validate_args(args)
  end

  private

  def validate_args(args)
    raise BitmapEditorErrors::BitmapCreationError unless args.count == 2
    if args.any? { |arg| letter?(arg) }
      raise BitmapEditorErrors::BitmapCreationError, "Height and Width must be numbers"
    end
  end

  def letter?(string)
    string =~ /[[:alpha:]]/
  end
end
