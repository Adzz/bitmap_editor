RSpec.describe Validate::Command do
  let(:error) { BitmapEditorErrors::UnrecognisedCommand }
  let(:commands) { ["A", "B"] }
  let(:message) { "unrecognised command :(" }

  describe '#call' do
    it 'raise if passed command is unrecognised' do
      expect { described_class.new.("Z", commands) }.to raise_error error, message
    end
  end
end
