module BitmapEditorErrors
  class InvalidArgument < StandardError
    def initialize(command)
      super("Invalid argument(s) for #{command} command")
    end
  end
end
