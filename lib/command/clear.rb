module Command
  class Clear
    def initialize(bitmap)
      @width = bitmap.width
      @height = bitmap.height
    end

    def execute
      Bitmap.new(@width, @height)
    end
  end
end
