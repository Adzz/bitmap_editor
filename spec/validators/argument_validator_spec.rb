RSpec.describe Validators::ArgumentValidator do
  subject(:argument_validator) { described_class.new }
  let(:unrecognised_command) { BitmapEditorErrors::UnrecognisedCommand }
  let(:invalid_arg) { BitmapEditorErrors::InvalidArgument }
  let(:unrecognised_command_message) { "unrecognised command :(" }
  let(:invalid_arg_message) { "Invalid argument(s) for A command" }
  let(:invalid_colour) { BitmapEditorErrors::InvalidColour }
  let(:invalid_colour_message) { "Colour is invalid :(" }
  let(:invalid_coordinates_message) { "Coordinates should be numbers" }
  let(:invalid_coordinate) { BitmapEditorErrors::InvalidCoordinate }

  before do
    stub_const("Validators::ArgumentValidator::COMMANDS", { "A" => 3, "C" => 0 })
    stub_const("Validators::ArgumentValidator::COLOUR_RANGE", ("A".."B").to_a)
  end

  it 'validates the command' do
    expect { argument_validator.("Z", "9") }.to raise_error unrecognised_command, unrecognised_command_message
  end

  it "validates the number of params for a command" do
    expect { argument_validator.("A", ["9", "10"]) }.to raise_error invalid_arg, invalid_arg_message
    expect { argument_validator.("A", ["9", "10", "1", "B"]) }.to raise_error invalid_arg, invalid_arg_message
  end

  it 'validates the colour, if given' do
    expect { argument_validator.("A", ["9", "10", "D"]) }.to raise_error invalid_colour, invalid_colour_message
    expect { argument_validator.("C", []) }.to raise_error invalid_colour, invalid_colour_message
  end

  it 'validates the coordinates are numbers' do
    expect { argument_validator.("A", ["B", "1", "B"]) }.to raise_error invalid_coordinate, invalid_coordinates_message
    expect { argument_validator.("A", ["1", "B", "B"]) }.to raise_error invalid_coordinate, invalid_coordinates_message
  end
end
