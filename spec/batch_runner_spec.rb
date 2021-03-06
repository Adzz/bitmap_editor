RSpec.describe BatchRunner do
  describe '#run' do
    let(:task) { double BitmapEditor }
    let(:file_path) { 'spec/fixtures/batch_runner.txt' }

    subject(:batch_runner) { described_class.new(file_path, task) }

    it 'runs a given task the correct number of times' do
      expect(task).to receive(:run).with('Test command').twice
      batch_runner.run
    end

    it 'raises an error for an invalid file' do
      message = 'please provide correct file'
      expect { described_class.new('not a file', task) }.to raise_error ArgumentError, message
    end
  end
end
