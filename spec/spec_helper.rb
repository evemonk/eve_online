require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'eve_online'

# webmock
require 'webmock/rspec'

# rspec-its
require 'rspec/its'
