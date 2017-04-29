RSpec.describe Bitmap do
  let(:error) { error = BitmapEditorErrors::BitmapCreationError }
  let(:message) { 'Bitmaps need a Height AND Width!' }

  it 'validates the number of params' do
    expect{ described_class.new(["5"]) }.to raise_error error, message
  end

  it 'validates the params are numbers' do
    message = 'Height and Width must be numbers'
    expect{ described_class.new(["A", "B"]) }.to raise_error error, message
  end
end
