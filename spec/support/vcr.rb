require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock

  # Ignore localhost requests (useful for things like Capybara)
  config.ignore_localhost = true

  # Filter sensitive data
  # config.filter_sensitive_data('<API_KEY>') { ENV['API_KEY'] }
end
