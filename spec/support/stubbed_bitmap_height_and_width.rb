RSpec.shared_context "stubbed bitmap height and width" do
  before do
    allow(bitmap).to receive(:width).and_return(4)
    allow(bitmap).to receive(:height).and_return(4)
  end
end
