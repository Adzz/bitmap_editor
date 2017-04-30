RSpec.describe BitmapEditor do
  let(:bitmap_klass) { double Bitmap }
  let(:bitmap_instance) { instance_double Bitmap }
  subject(:bitmap_editor) { described_class.new(bitmap_klass) }

  describe '#run' do
    before { allow(bitmap_klass).to receive(:new).and_return(bitmap_instance) }

    describe 'I command - new bitmap' do
      let(:command) { "I 5 5" }

      it 'creates a new bitmap' do
        bitmap_editor.run(command)
        expect(bitmap_editor.bitmap).to eq bitmap_instance
      end

      it 'with the correct params' do
        expect(bitmap_klass).to receive(:new).with(["5", "5"]).once
        bitmap_editor.run(command)
      end
    end

    describe 'C command - resets all colors to default color' do
      let(:command) { "C" }
      let(:error) { BitmapEditorError::NoBitmap }
      let(:message) { "There's no bitmap to edit! We need to make one first" }

      before do
        allow(bitmap_instance).to receive(:width).and_return(2)
        allow(bitmap_instance).to receive(:height).and_return(2)
      end

      it 'turns all pixels to the default color' do
        bitmap_editor.run("I 2 2")
        expect(bitmap_klass).to receive(:new).with(["2", "2"])
        bitmap_editor.run("C")
      end

      it 'raises an error if there is no bitmap to clear' do
        expect { bitmap_editor.run("C") }.to raise_error error, message
      end
    end
  end
end
