RSpec.describe Command::New do
  let(:bitmap) { instance_double Bitmap }
  let(:command) { described_class.new(bitmap, ["1", "1"]) }

  it_behaves_like "it validates number of arguments" do
    let(:required_args) { 2 }
  end

  it_behaves_like "it validates arguments are numbers" do
    let(:expected_args) { ["1", "1"] }
  end
end
