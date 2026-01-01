# frozen_string_literal: true

require "simplecov"

SimpleCov.start do
  enable_coverage :branch
  enable_coverage_for_eval
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "eve_online"

# rspec-its
require "rspec/its"

require "active_support"
require "active_support/time"

# vcr
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

require "pry"
