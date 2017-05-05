RSpec.describe Command::New do
  let(:command) { described_class.new(["1", "1"]) }

  it_behaves_like "it validates number of arguments" do
    let(:required_args) { 2 }
  end

  it_behaves_like "it validates arguments are numbers" do
    let(:expected_args) { ["1", "1"] }
  end

  it 'validates coordinates' do
    expect_any_instance_of(Validate::Coordinates).to receive(:call).with(1, 1).once
    command.execute
  end

  describe '#execute' do
    it 'creates a new bitmap with the same height and width' do
      expect_any_instance_of(Bitmap).to receive(:initialize).with(1, 1).once
      command.execute
    end
  end
end
