require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'eve_online'

# webmock
require 'webmock/rspec'

# rspec-its
require 'rspec/its'

RSpec.configure do |config|
  config.after(:suite) do
    WebMock.allow_net_connect!
  end
end
