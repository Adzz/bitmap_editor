RSpec.describe BitmapEditor do
  subject(:bitmap_editor) { described_class.new }

  describe '#run' do
    describe 'I command - new bitmap' do
      let(:command) { "I 5 5" }

      it 'creates a new bitmap' do
        expect { bitmap_editor.run(command) }.to change { bitmap_editor.bitmaps.length }.from(0).to(1)
      end
    end
  end
end
