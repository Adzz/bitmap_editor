RSpec.describe Command::Clear do
  include_context "stubbed bitmap height and width"

  let(:bitmap) {instance_double Bitmap }
  subject(:command) { described_class.new(bitmap) }

  describe '#execute' do
    it 'creates a new bitmap with the same height and width' do
      expect(Bitmap).to receive(:new).with(4, 4).once
      command.execute
    end
  end
end
