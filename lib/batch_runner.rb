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
    raise ArgumentError, "please provide correct file" if file_path.nil? || !File.exists?(file_path)
    @file_path = file_path
  end
end
