RSpec.describe Command::DrawALine do
  let(:bitmap) { instance_double Bitmap }

  let(:sub_command) { double Command::ColourAPixel, new: sub_command_instance }
  let(:sub_command_instance) { instance_double Command::ColourAPixel }
  let(:line) { double VerticalLine, new: line_instance }
  let(:line_instance) { instance_double VerticalLine, coordinates: [[1,1],[1,2]] }
  let(:command) do
    described_class.new(bitmap, ["1", "1", "2", "A"], line, sub_command)
  end

  before do
    allow(sub_command_instance).to receive(:execute)
  end

  it_behaves_like "it validates number of arguments" do
    let(:required_args) { 4 }
  end

  it_behaves_like "it validates arguments are numbers" do
    let(:expected_args) { ["1", "1", "2"] }
  end

  describe '#execute' do
    #  test the side effect
    it 'executes the subcommand for each set of coordinates' do
      expect(sub_command_instance).to receive(:execute).twice
      command.execute
    end

    it 'sends the correct arguments' do
      allow(line_instance).to receive(:coordinates).and_return([[1, 1]])
      expect(sub_command).to receive(:new).with(bitmap, [1, 1, "A"])
      command.execute
    end
    # test the return value
    it 'returns the modified state' do
      expect(command.execute).to eq bitmap
    end
  end
end
