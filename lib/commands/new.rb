module Commands
  class New
    def initialize(bitmap, args)
      @width = args[0].to_i
      @height = args[1].to_i
      Validators::CoordinateValidator.new.(width, height)
    end

    def execute
      Bitmap.new(width, height).image
    end
  end
end
