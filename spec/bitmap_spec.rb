RSpec.describe Bitmap do
  let(:error) { BitmapEditorError::BitmapCreationError }
  let(:message) { 'Bitmaps need a Height AND Width!' }
  let(:default_color) { "A" }
  subject(:bitmap) { described_class.new(["2", "2"], default_color) }

  it 'validates the number of params' do
    expect{ described_class.new(["5"]) }.to raise_error error, message
  end

  it 'validates the params are numbers' do
    message = "Height and Width must be numbers"
    expect{ described_class.new(["A", "B"]) }.to raise_error error, message
  end

  describe '#image' do
    it 'creates an image of the default colour' do
      expect(bitmap.image).to eq [["A", "A"], ["A", "A"]]
    end

    it 'with the correct height and width' do
      # height
      expect(bitmap.image.length).to eq 2
      # width
      expect(bitmap.image.first.length).to eq 2
    end
  end

  describe '#to_s' do
    it 'creates a string representation of the bitmap' do
      expect(bitmap.to_s).to eq "AA\nAA"
    end
  end
end
