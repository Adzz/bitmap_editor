RSpec.describe BitmapEditor do
  let(:bitmap) { double Bitmap }
  subject(:bitmap_editor) { described_class.new(bitmap) }

  describe '#run' do
    describe 'I command - new bitmap' do
      let(:command) { "I 5 5" }
      before { allow(bitmap).to receive(:new) }

      it 'creates a new bitmap' do
        expect { bitmap_editor.run(command) }.to change { bitmap_editor.bitmaps.length }.from(0).to(1)
      end

      it 'with the correct params' do
        expect(bitmap).to receive(:new).with(["5", "5"]).once
        bitmap_editor.run(command)
      end
    end
  end
end
