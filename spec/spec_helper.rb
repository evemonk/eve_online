require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'eve_online'

# rspec-its
require 'rspec/its'

Time.zone = 'UTC'
