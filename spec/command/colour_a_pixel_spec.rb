RSpec.describe Commands::ColourAPixel do
  let(:bitmap) { instance_double Bitmap }

  before do
    allow(bitmap).to receive(:width).and_return(5)
    allow(bitmap).to receive(:height).and_return(5)
  end

  it 'calls colour_a_pixel with the correct arguments' do
    expect(bitmap).to receive(:colour_a_pixel).with(4, 4, "R").once
    described_class.new(bitmap, ["4", "4", "R"]).execute
  end
end
