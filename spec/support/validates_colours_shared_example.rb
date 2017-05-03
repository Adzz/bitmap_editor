RSpec.shared_examples "it validates colours" do
  before do
    stub_const("Validate::Colour::COLOUR_RANGE", ("A".."D").to_a)
  end

  it 'validates the colour is in range' do
    expect_any_instance_of(Validate::Colour)
      .to receive(:call).with(colour).once
    command.execute
  end
end
