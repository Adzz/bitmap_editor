RSpec.describe Validators::CoordinateValidator do
  subject(:validator) { described_class.new }

  before do
    stub_const("Validators::CoordinateValidator::BOARD_RANGE", (1..5).to_a)
  end

  describe '#call' do
    context 'bitmap creation validation' do
      it 'raises an error if x is not within acceptable board range' do
        message = "Height and Width must be between 1 and 5"
        expect { validator.(6, 1) }.to raise_error BitmapEditorErrors::BitmapCreationError, message
      end

      it 'raises an error if y is not within accepatble board range' do
        message = "Height and Width must be between 1 and 5"
        expect { validator.(1, 6) }.to raise_error BitmapEditorErrors::BitmapCreationError, message
      end
    end

    context 'when passed a bitmap' do
      let(:bitmap) { instance_double Bitmap }

      before do
        allow(bitmap).to receive(:height).and_return(5)
        allow(bitmap).to receive(:width).and_return(5)
      end

      it 'raises an error if x is not within the bitmap' do
        message = "One or more coordinates are outside the bounds of the bitmap"
        expect { validator.(6, 1, bitmap) }.to raise_error BitmapEditorErrors::InvalidCoordinate, message
      end

      it 'raises an error if y is not within the bitmap' do
        message = "One or more coordinates are outside the bounds of the bitmap"
        expect { validator.(1, 6, bitmap) }.to raise_error BitmapEditorErrors::InvalidCoordinate, message
      end
    end
  end
end
