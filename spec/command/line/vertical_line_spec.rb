RSpec.describe VerticalLine do
  describe '#coordinates' do
    it 'generates an array of coordinates for the line' do
      horizontal_line = described_class.new([1, 1, 2])
      expect(horizontal_line.coordinates).to eq [[1, 1], [1, 2]]
    end

    it 'order of the start and finish (length) arguments dont matter' do
      horizontal_line = described_class.new([1, 2, 1])
      expect(horizontal_line.coordinates).to eq [[1, 1], [1, 2]]
    end
  end
end
