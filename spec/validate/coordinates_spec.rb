RSpec.describe Validate::Coordinates do
  subject(:validate) { described_class.new }

  describe '#call' do
    context 'bitmap passed in' do
      include_context 'stubbed bitmap height and width'

      let(:error) { BitmapEditorErrors::InvalidCoordinate }
      let(:message) { "One or more coordinates are outside the bounds of the bitmap" }

      let(:bitmap) { instance_double Bitmap }

      it 'will raise if x is larger than the bitmap width' do
        expect { validate.(6, 3, bitmap) }.to raise_error error, message
      end

      it 'will raise if y is larger than the bitmap height' do
        expect { validate.(3, 6, bitmap) }.to raise_error error, message
      end

      it 'wont raise if they are not' do
        expect { validate.(3, 3, bitmap) }.to_not raise_error
      end
    end

    context 'bitmap not passed in' do
      let(:error) { BitmapEditorErrors::BitmapCreationError }
      let(:message) { "Height and Width must be between 1 and 3" }

      before { stub_const('Validate::Coordinates::BOARD_RANGE', [1,2,3]) }

      it 'will raise if x is larger than the board range' do
        expect { validate.(6, 3) }.to raise_error error, message
      end

      it 'will raise if y is larger than the board range' do
        expect { validate.(3, 6) }.to raise_error error, message
      end

      it 'wont raise if they are not' do
        expect { validate.(3, 3) }.to_not raise_error
      end
    end
  end
end
