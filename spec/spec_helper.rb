require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'eve_online'

# rspec-its
require 'rspec/its'

Time.zone = 'UTC'

require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/cassettes'
end
