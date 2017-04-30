RSpec.describe BitmapEditor do
  let(:bitmap_klass) { double Bitmap }
  let(:bitmap_instance) { instance_double Bitmap }
  let(:no_bitmap_error) { BitmapEditorError::NoBitmap }
  let(:no_bitmap_message) { "There's no bitmap to edit! We need to make one first" }
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
      let(:error) { BitmapEditorError::NoBitmap }
      let(:message) { "There's no bitmap to edit! We need to make one first" }

      before do
        allow(bitmap_instance).to receive(:width).and_return(2)
        allow(bitmap_instance).to receive(:height).and_return(2)
      end

      it 'turns all pixels to the default color' do
        create_bitmap(bitmap_editor)
        expect(bitmap_klass).to receive(:new).with(["2", "2"])
        bitmap_editor.run( "C")
      end

      it 'raises an error if there is no bitmap to clear' do
        expect { bitmap_editor.run("C") }.to raise_error no_bitmap_error, no_bitmap_message
      end
    end

    describe 'S commamnd - outputs to standard out' do
      it 'calls puts on the bitmap' do
        create_bitmap(bitmap_editor)
        expect(bitmap_instance).to receive(:to_s).once
        bitmap_editor.run("S")
      end

      it 'raises a no bitmap error if there is no bitmap to show' do
        expect { bitmap_editor.run("S") }.to raise_error no_bitmap_error, no_bitmap_message
      end
    end

    describe 'L command - colour a pixel at a given coordinate' do
      let(:colour_a_pix_klass) { double Command::ColourAPixel }
      let(:colour_a_pix_instance) { instance_double Command::ColourAPixel }
      subject(:bitmap_editor) { described_class.new(bitmap_klass, colour_a_pix_klass) }

      before do
        allow(colour_a_pix_klass).to receive(:new).and_return(colour_a_pix_instance)
        allow(colour_a_pix_instance).to receive(:execute)
      end

      it 'raises a no bitmap error if there is no bitmap to show' do
        expect { bitmap_editor.run("S") }.to raise_error no_bitmap_error, no_bitmap_message
      end

      it 'instantiates the colour pixel command with correct params' do
        create_bitmap(bitmap_editor)
        expect(colour_a_pix_klass).to receive(:new).with(bitmap_instance, ["1", "1", "R"]).once
        bitmap_editor.run("L 1 1 R")
      end

      it 'calls execute' do
        create_bitmap(bitmap_editor)
        expect(colour_a_pix_instance).to receive(:execute).once
        bitmap_editor.run("L 1 1 R")
      end
    end

    def create_bitmap(bitmap_editor)
      bitmap_editor.run("I 2 2")
    end
  end
end
