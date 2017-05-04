RSpec.describe Validate::Command do
  let(:error) { BitmapEditorErrors::UnrecognisedCommand }
  let(:message) { "unrecognised command :(" }

  describe '#call' do
    it 'raise if passed command is unrecognised' do
      expect { described_class.new.("Z") }.to raise_error error, message
    end
  end
end
