module Validate
  class Coordinates
    BOARD_RANGE = (1..250).to_a

    def call(x, y, bitmap = false)
      error = bitmap ? coordinate_error : creation_error
      x_max = bitmap ? bitmap.width : BOARD_RANGE.max
      y_max = bitmap ? bitmap.height : BOARD_RANGE.max

      raise error unless x.between?(BOARD_RANGE.min, x_max) && y.between?(BOARD_RANGE.min, y_max)
    end

    private

    def creation_error
      BitmapEditorErrors::BitmapCreationError.new(
        "Height and Width must be between #{BOARD_RANGE.min} and #{BOARD_RANGE.max}"
      )
    end

    def coordinate_error
      BitmapEditorErrors::InvalidCoordinate.new(
        "One or more coordinates are outside the bounds of the bitmap"
      )
    end
  end
end
