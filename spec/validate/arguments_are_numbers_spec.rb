RSpec.describe Validate::ArgumentsAreNumbers do
  let(:error) { BitmapEditorErrors::InvalidArgumentType }
  let(:message) { "Argument should have been a number" }

  describe '#call' do
    it 'will raise if passed command is not a number' do
      expect { described_class.new.(["Z"]) }.to raise_error error, message
      expect { described_class.new.(["a"]) }.to raise_error error, message
      expect { described_class.new.(["a"]) }.to raise_error error, message
      expect { described_class.new.(["ONE"]) }.to raise_error error, message
      expect { described_class.new.(["twenty two"]) }.to raise_error error, message
      expect { described_class.new.(["ç"]) }.to raise_error error, message
      expect { described_class.new.(["1"]) }.to_not raise_error
      expect { described_class.new.([1]) }.to_not raise_error
    end
  end
end
