module Command
  class Show
    def initialize(bitmap, output = $stdout)
      @bitmap = bitmap
      @output = output
    end

    def execute
      @output.puts @bitmap
    end
  end
end
