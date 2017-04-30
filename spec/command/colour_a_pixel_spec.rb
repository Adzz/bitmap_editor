RSpec.describe Command::ColourAPixel do
  let(:bitmap) { instance_double Bitmap }
  let(:arg_error) { BitmapEditorError::InvalidArgument }

  before do
    allow(bitmap).to receive(:height).and_return(4)
    allow(bitmap).to receive(:width).and_return(4)
  end

  context 'validation' do
    it 'validates the number of arguments' do
      message = "Invalid argument: we need an x and y coordinate and a colour"
      expect { described_class.new(bitmap, ["1", "1"]) }.to raise_error arg_error, message
    end

    it 'validates the x and y coordinates are numbers' do
      message = "Invalid argument: x and y coordinates should be numbers"
      expect { described_class.new(bitmap, ["1", "B", "A"]) }.to raise_error arg_error, message
    end

    it 'validates the colour is a colour' do
      message = "Invalid argument: colour must be in the colour range"
      expect { described_class.new(bitmap, ["1", "1", "%"]) }.to raise_error arg_error, message
    end

    it 'validates the coordinates fit on the bitmap' do
      message = "Invalid argument: coordinates dont fit on the bitmap"
      expect { described_class.new(bitmap, ["1", "5", "A"]) }.to raise_error arg_error, message
      expect { described_class.new(bitmap, ["5", "1", "A"]) }.to raise_error arg_error, message
      expect { described_class.new(bitmap, ["5", "5", "A"]) }.to raise_error arg_error, message
      expect { described_class.new(bitmap, ["0", "0", "A"]) }.to raise_error arg_error, message
      expect { described_class.new(bitmap, ["0", "1", "A"]) }.to raise_error arg_error, message
      expect { described_class.new(bitmap, ["1", "0", "A"]) }.to raise_error arg_error, message
    end
  end

  it 'calls colour_a_pixel with the correct arguments' do
    expect(bitmap).to receive(:colour_a_pixel).with(4, 4, "R").once
    described_class.new(bitmap, ["4", "4", "R"]).execute
  end
end


# dynamic class creation of an error. Use class name to generate an error class
