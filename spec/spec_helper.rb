require "pry"

Dir["./spec/support/**/*.rb"].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.warnings = true
  config.order = :random

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
end
