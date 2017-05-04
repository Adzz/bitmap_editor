RSpec.describe BitmapEditor do
  subject(:bitmap_editor) { described_class.new }

  describe '#run' do
    let(:no_bitmap) { BitmapEditorErrors::NoBitmap }

    it 'validates the existence of a bitmap' do
      expect { bitmap_editor.run('S') }.to raise_error no_bitmap
    end

    it 'wont raise if there is not bitmap, but the command is to create one' do
      expect { create_bitmap(bitmap_editor) }.to_not raise_error
    end

    it 'validtes the command given' do
      expect_any_instance_of(Validate::Command).to receive(:call).with("I")
      create_bitmap(bitmap_editor)
    end

    context 'I command - new bitmap' do
      let(:new_instance) {  instance_double Command::New}
      it 'initializes with the correct args' do
        allow_any_instance_of(Command::New).to receive(:initialize).and_return(new_instance)
        allow(new_instance).to receive(:execute)
        expect(Command::New).to receive(:new).with(["4", "4"])
        create_bitmap(bitmap_editor)
      end

      it 'calls execute' do
        expect_any_instance_of(Command::New).to receive(:execute)
        create_bitmap(bitmap_editor)
      end
    end
  end

  def create_bitmap(editor)
    editor.run("I 4 4")
  end
end
