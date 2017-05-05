# Exceptions
require './lib/bitmap_editor_errors/bitmap_creation_error'
require './lib/bitmap_editor_errors/no_bitmap'
require './lib/bitmap_editor_errors/invalid_number_of_arguments'
require './lib/bitmap_editor_errors/invalid_colour'
require './lib/bitmap_editor_errors/invalid_coordinate'
require './lib/bitmap_editor_errors/unrecognised_command'

# Lib
require './lib/bitmap_editor'
require './lib/bitmap'

# commands
require './lib/command/new.rb'
require './lib/command/clear'
require './lib/command/colour_a_pixel'
require './lib/command/line/horizontal_line'
require './lib/command/line/vertical_line'
require './lib/command/show'
require './lib/command/draw_a_line'

# Validators
require './lib/validate/arguments_are_numbers'
require './lib/validate/colour'
require './lib/validate/command'
require './lib/validate/coordinates'
require './lib/validate/number_of_arguments'

class BatchRunner
  def initialize(file_path, task = BitmapEditor.new)
    validate_file(file_path)
    @task = task
  end

  def run
    File.open(file_path).each do |line|
      task.run(line.chomp)
    end
  end

  private

  attr_reader :file_path, :task

  def validate_file(file_path)
    raise ArgumentError, "please provide correct file" if file_path.nil? || !File.exist?(file_path)
    @file_path = file_path
  end
end
