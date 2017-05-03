RSpec.describe Bitmap do
  subject(:bitmap) { described_class.new(2, 2) }

  describe '#image' do
    it 'returns an image of the default colour' do
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
