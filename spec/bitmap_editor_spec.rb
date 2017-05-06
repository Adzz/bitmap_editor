RSpec.describe BitmapEditor do
  let(:output) { StringIO.new }
  subject(:bitmap_editor) { described_class.new(Bitmap, output) }

  describe '#run' do
    let(:no_bitmap) { BitmapEditorErrors::NoBitmap }

    it 'validates the existence of a bitmap' do
      expect { bitmap_editor.run('S') }.to raise_error no_bitmap
    end

    it 'wont raise if there is not bitmap, but the command is to create one' do
      expect { create_bitmap(bitmap_editor) }.to_not raise_error
    end

    it 'validtes the command given' do
      stub_const("BitmapEditor::COMMANDS", ["I", "A"])
      expect_any_instance_of(Validate::Command).to receive(:call).with("I", ["I", "A"])
      create_bitmap(bitmap_editor)
    end

    context 'commands' do
      before { create_bitmap(bitmap_editor) }

      it 'I - new bitmap - creates a bitmap' do
        expected = Bitmap.new(4, 4)
        expect(bitmap_editor.bitmap.image).to eq expected.image
        expect(bitmap_editor.bitmap.width).to eq expected.width
        expect(bitmap_editor.bitmap.height).to eq expected.height
      end

      it 'C clears a bitmap - creates a new bitmap with the default color + size' do
        existing = Bitmap.new(4, 4)
        bitmap_editor.run("C")

        expect(bitmap_editor.bitmap.image).to eq existing.image
        expect(bitmap_editor.bitmap.width).to eq existing.width
        expect(bitmap_editor.bitmap.height).to eq existing.height
      end

      it 'L colours a pixel - colours a given pixel on the bitmap' do
        bitmap_editor.run("L 1 1 Z")
        expected_image = [
          ["Z","O","O","O",],
          ["O","O","O","O",],
          ["O","O","O","O",],
          ["O","O","O","O",]
        ]

        expect(bitmap_editor.bitmap.image).to eq expected_image
      end

      it 'H draws a horizontal line on the bitmap' do
        bitmap_editor.run("H 1 3 2 Z")
        expected_image = [
          ["O","O","O","O",],
          ["Z","Z","Z","O",],
          ["O","O","O","O",],
          ["O","O","O","O",]
        ]

        expect(bitmap_editor.bitmap.image).to eq expected_image
      end

      it 'V draws a vertical line on the bitmap' do
        bitmap_editor.run("V 1 1 3 Z")
        expected_image = [
          ["Z","O","O","O",],
          ["Z","O","O","O",],
          ["Z","O","O","O",],
          ["O","O","O","O",]
        ]

        expect(bitmap_editor.bitmap.image).to eq expected_image
      end

      it 'S out puts the string representation to stdout' do
        bitmap_editor.run("S")
        expect(output.string).to eq "OOOO\nOOOO\nOOOO\nOOOO\n"
      end
    end
  end

  def create_bitmap(editor)
    editor.run("I 4 4")
  end
end
