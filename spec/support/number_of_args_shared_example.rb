RSpec.shared_examples "it validates number of arguments" do
  before do
    stub_const("#{described_class}::REQUIRED_LENGTH_OF_ARGS", required_args)
  end

  it 'validates the number of arguments it should have' do
    expect_any_instance_of(Validate::NumberOfArguments)
      .to receive(:call).with(required_args, required_args).once
    command.execute
  end
end
