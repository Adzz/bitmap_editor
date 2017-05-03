RSpec.describe HorizontalLine do
  describe '#coordinates' do
    it 'generates an array of coordinates for the line' do
      horizontal_line = described_class.new([1, 2, 1])
      expect(horizontal_line.coordinates).to eq [[1, 1], [2, 1]]
    end

    it 'order of the start and finish (length) arguments dont matter' do
      horizontal_line = described_class.new([2, 1, 1])
      expect(horizontal_line.coordinates).to eq [[1, 1], [2, 1]]
    end
  end
end
