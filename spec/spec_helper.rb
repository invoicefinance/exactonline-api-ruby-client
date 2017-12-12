require 'simplecov'
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_group 'Elmas', 'lib/elmas'
  add_group 'Faraday Middleware', 'lib/faraday'
  add_group 'Specs', 'spec'
end

require File.expand_path('../../lib/elmas', __FILE__)

require 'rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include WebMock::API
  config.before(:each) do
    Elmas.reset
  end
end
