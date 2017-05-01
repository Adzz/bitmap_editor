RSpec.describe Commands::HorizontalLine do
  let(:bitmap) { instance_double Bitmap }
  let(:arg_error) { BitmapEditorError::InvalidArgument }

  before do
    allow(bitmap).to receive(:height).and_return(4)
    allow(bitmap).to receive(:width).and_return(4)
  end

  context 'validations' do
    # calls the validator
  end
end
