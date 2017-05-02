module Commands
  class Show
    def initialize(bitmap, args)
      @sub_command = Commands::New.new(bitmap, [bitmap.width, bitmap.height])
    end

    def execute
      @sub_command.execute
    end
  end
end
