RSpec.describe VerticalLine do
  describe '#coordinates' do
    let(:result) { [[3, 1], [3, 2], [3, 3]] }

    it 'generates an array of coordinates for the line' do
      vertical_line = described_class.new([3, 1, 3])
      expect(vertical_line.coordinates).to eq result
    end

    it 'order of the start and finish (length) arguments dont matter' do
      vertical_line = described_class.new([3, 3, 1])
      expect(vertical_line.coordinates).to eq result
    end
  end
end
