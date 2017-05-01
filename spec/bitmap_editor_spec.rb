RSpec.describe BitmapEditor do
  let(:bitmap_klass) { double Bitmap }
  let(:bitmap_instance) { instance_double Bitmap }
  let(:no_bitmap_error) { BitmapEditorErrors::NoBitmap }
  let(:no_bitmap_message) { "There's no bitmap! We need to make one first" }
  let(:validator_klass) { double Validators::ArgumentValidator }
  let(:validator) { instance_double Validators::ArgumentValidator }
  subject(:bitmap_editor) { described_class.new(bitmap_klass, validator_klass) }

  describe '#run' do
    before do
      allow(bitmap_klass).to receive(:new).and_return(bitmap_instance)
      allow(validator_klass).to receive(:new).and_return(validator)
      allow(validator).to receive(:call)
    end

    it 'raises an error if a bitmap is edited before it is created' do
      expect { bitmap_editor.run("C") }.to raise_error no_bitmap_error, no_bitmap_message
    end

    it 'sends the command and arguments to the argument validator' do
      expect(validator).to receive(:call).with("I", ["2", "2"]).once
      create_bitmap(bitmap_editor)
    end

    describe 'I command - new bitmap' do
      let(:command) { "I 5 5" }

      it 'creates a new bitmap' do
        create_bitmap(bitmap_editor)
        expect(bitmap_editor.bitmap).to eq bitmap_instance
      end

      it 'with the correct params' do
        expect(bitmap_klass).to receive(:new).with(["5", "5"]).once
        bitmap_editor.run(command)
      end
    end

    describe 'C command - resets all colors to default color' do
      let(:error) { BitmapEditorErrors::NoBitmap }
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
      before do
        allow_any_instance_of(Commands::ColourAPixel).to receive(:new)
        allow_any_instance_of(Commands::ColourAPixel).to receive(:execute)
      end

      it 'raises a no bitmap error if there is no bitmap to show' do
        expect { bitmap_editor.run("L 1 1 R") }.to raise_error no_bitmap_error, no_bitmap_message
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

    describe 'H command - draws a horizontal line in a given colour' do
      before do
        allow_any_instance_of(Commands::HorizontalLine).to receive(:initialize)
        allow_any_instance_of(Commands::HorizontalLine).to receive(:execute)
      end

      it 'raises a no bitmap error if there is no bitmap to show' do
        expect { bitmap_editor.run("H 3 5 2 Z") }.to raise_error no_bitmap_error, no_bitmap_message
      end

      it 'instantiates the colour pixel command with correct params' do
        create_bitmap(bitmap_editor)
        expect(horizontal_line_klass).to receive(:new).with(bitmap_instance, ["3", "5", "2", "Z"]).once
        bitmap_editor.run("H 3 5 2 Z")
      end

      it 'calls execute' do
        create_bitmap(bitmap_editor)
        expect(horizontal_line_instance).to receive(:execute).once
        bitmap_editor.run("H 3 5 2 Z")
      end
    end

    def create_bitmap(bitmap_editor)
      bitmap_editor.run("I 2 2")
    end
  end
end
