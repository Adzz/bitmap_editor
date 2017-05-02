RSpec.describe Command::ColourAPixel do
  let(:bitmap) { instance_double Bitmap }
  let(:command) { described_class.new(bitmap, ["1", "1", "A"]) }

  before do
    allow(bitmap).to receive(:colour_a_pixel)
    allow(bitmap).to receive(:width).and_return(4)
    allow(bitmap).to receive(:height).and_return(4)
  end

  it_behaves_like "it validates number of arguments" do
    let(:required_args) { 3 }
  end

  it_behaves_like "it validates arguments are numbers" do
    let(:expected_args) { ["1", "1"] }
  end

  it_behaves_like "it validates colours" do
    let(:colour) { "A" }
  end

  it 'calls colour_a_pixel with the correct arguments' do
    expect(bitmap).to receive(:colour_a_pixel).with(1, 1, "A").once
    command.execute
  end
end
