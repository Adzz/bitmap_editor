RSpec.describe Command::Clear do
  let(:bitmap)    {instance_double Bitmap }
  subject(:clear) { described_class.new(bitmap, []) }

  before do
    allow(bitmap).to receive(:width).and_return(4)
    allow(bitmap).to receive(:height).and_return(4)
  end

  it_behaves_like "it validates number of arguments" do
    let(:required_args) { 0 }
    let(:command) { clear }
  end

  it 'creates a new bitmap with the same height and width' do
    expect(Bitmap).to receive(:new).with(4, 4).once
    clear.execute
  end
end
