RSpec.shared_examples "it validates coordinates" do
  it 'calls the validator with the correct params' do
    expect_any_instance_of(Validate::Coordinates)
      .to receive(:call).with(x_coord, y_coord, bitmap).once
    command.execute
  end
end
