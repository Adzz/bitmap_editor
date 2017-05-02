shared_examples "it validates arguments are numbers" do
  it 'it validates arguments are numbers' do
    expect_any_instance_of(Validate::ArgumentsAreNumbers)
      .to receive(:call).with(expected_args).once
    command.execute
  end
end
