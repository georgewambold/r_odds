require "bundler/setup"
Bundler.setup

require "r_odds"
require "pry"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
    mocks.verify_partial_doubles        = true
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
