RSpec.describe Command::VerticalLine do
  let(:bitmap) { instance_double Bitmap }
  let(:command) { described_class.new(bitmap, ["1", "2", "1", "A"]) }

  before do
    allow(bitmap).to receive(:height).and_return(4)
    allow(bitmap).to receive(:width).and_return(4)
    allow(bitmap).to receive(:colour_a_pixel)
  end

  it_behaves_like "it validates number of arguments" do
    let(:required_args) { 4 }
  end

  it_behaves_like "it validates arguments are numbers" do
    let(:expected_args) { ["1", "2", "1"] }
  end

  it_behaves_like "it validates colours" do
    let(:colour) { "A" }
  end

  it 'allows drawing lines backwards' do
  end

  it 'draws a line' do
  end
end
