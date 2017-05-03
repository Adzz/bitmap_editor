module Command
  class Show
    def initialize(bitmap)
      @bitmap = bitmap
    end

    def execute
      puts @bitmap
    end
  end
end
