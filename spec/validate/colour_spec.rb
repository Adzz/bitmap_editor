RSpec.describe Validate::Colour do
  let(:error) { BitmapEditorErrors::InvalidColour }
  let(:message) { "Colour is invalid :(" }

  subject(:validate) { described_class.new }
  before { stub_const('Validate::Colour::COLOUR_RANGE', ["A", "B"]) }

  describe '#call' do
    it 'will raise if colour is outside the color range' do
      expect { validate.("Z") }.to raise_error error, message
    end

    it 'wont raise if it isnt' do
      expect { validate.("A") }.to_not raise_error
    end
  end
end
