RSpec.describe Validate::NumberOfArguments do
  let(:error) { BitmapEditorErrors::InvalidNumberOfArguments }
  let(:message) {  "1 args given, required 3" }

  describe '#call' do
    it "raises an error if the required number of args doesn't match the given number of args" do
      expect { described_class.new.(1, 3) }.to raise_error error
    end
  end
end
