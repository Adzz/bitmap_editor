RSpec.describe Command::Show do
  let(:bitmap) { instance_double Bitmap }
  let(:output) { StringIO.new }
  let(:command) { described_class.new(bitmap, output) }

  describe '#execute' do
    before { allow(bitmap).to receive(:to_s).and_return("OOOO\nOOOO\nOOOO\nOOOO\n") }

    it 'outputs the result (to stdout)' do
      command.execute
      expect(output.string).to eq "OOOO\nOOOO\nOOOO\nOOOO\n"
    end
  end
end
