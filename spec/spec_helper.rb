# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  enable_coverage :branch
  if Gem::Version.new(RUBY_VERSION) > Gem::Version.new("3.2.0")
    enable_coverage_for_eval
  end
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "eve_online"

# rspec-its
require "rspec/its"

require "active_support"
require "active_support/time"
Time.zone = "UTC"

# vcr
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

require "pry"
