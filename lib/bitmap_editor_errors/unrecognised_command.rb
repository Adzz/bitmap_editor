module BitmapEditorErrors
  class UnrecognisedCommand < StandardError
    def initialize(msg = "unrecognised command :(")
      super
    end
  end
end
