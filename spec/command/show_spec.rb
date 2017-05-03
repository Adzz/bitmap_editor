RSpec.describe Command::Show do
  let(:bitmap) { instance_double Bitmap }
  let(:command) { described_class.new(bitmap) }

  describe '#execute' do
    it 'calls to_s on the bitmap instance' do
      expect(bitmap).to receive(:to_s).once
      command.execute
    end
  end
end
