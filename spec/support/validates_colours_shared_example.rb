shared_examples "it validates colours" do
  before do
    stub_const("Validate::Colour::COLOUR_RANGE", ("A".."D").to_a)
    allow(bitmap).to receive(:width).and_return(4)
    allow(bitmap).to receive(:height).and_return(4)
  end

  it 'validates the colour is in range' do
    expect_any_instance_of(Validate::Colour)
      .to receive(:call).with(colour).once
    command.execute
  end
end
