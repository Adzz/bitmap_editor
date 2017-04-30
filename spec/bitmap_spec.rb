RSpec.describe Bitmap do
  let(:error) { BitmapEditorError::BitmapCreationError }
  let(:message) { 'Bitmaps need a Height AND Width!' }
  subject(:bitmap) { described_class.new(["2", "2"]) }

  context 'validations' do
    it 'validates the number of params' do
      expect{ described_class.new(["5"]) }.to raise_error error, message
    end

    it 'validates the params are numbers' do
      message = "Height and Width must be numbers"
      expect{ described_class.new(["A", "B"]) }.to raise_error error, message
    end

    it "ensures it can't be bigger than the max height and width" do
      stub_const('Bitmap::BOARD_RANGE', (1..30).to_a)
      message = "Height and Width must be between 1 and 30"
      expect{ described_class.new(["1", "100"]) }.to raise_error error, message
      expect{ described_class.new(["100", "1"]) }.to raise_error error, message
      expect{ described_class.new(["0", "0"]) }.to raise_error error, message
      expect{ described_class.new(["100", "100"]) }.to raise_error error, message
    end
  end

  describe '#image' do
    it 'creates an image of the default colour' do
      expect(bitmap.image).to eq [["O", "O"], ["O", "O"]]
    end
  end

  describe '#height' do
    it 'returns the height of a bitmap' do
      expect(bitmap.height).to eq 2
    end
  end

  describe '#width' do
    it 'returns the height of a bitmap' do
      expect(bitmap.width).to eq 2
    end
  end

  describe '#to_s' do
    it 'creates a string representation of the bitmap' do
      expect(bitmap.to_s).to eq "OO\nOO"
    end
  end

  describe '#colour_a_pixel' do
    it 'changes the colour of a given pixel' do
      expect(bitmap.colour_a_pixel(1, 1, "R")).to eq [["R", "O"], ["O", "O"]]
    end
  end
end
