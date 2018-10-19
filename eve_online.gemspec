# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eve_online/version'

Gem::Specification.new do |spec|
  spec.name          = 'eve_online'
  spec.version       = EveOnline::VERSION
  spec.authors       = ['Igor Zubkov']
  spec.email         = ['igor.zubkov@gmail.com']

  spec.summary       = 'EveOnline ESI API.'
  spec.description   = 'EveOnline ESI API.'
  spec.homepage      = 'https://github.com/evemonk/eve_online'
  spec.license       = 'MIT'

  # https://guides.rubygems.org/specification-reference/#metadata
  spec.metadata = {
      'bug_tracker_uri'   => "https://example.com/user/bestgemever/issues",
      'changelog_uri'     => "https://example.com/user/bestgemever/CHANGELOG.md",
      'documentation_uri' => "https://www.example.info/gems/bestgemever/0.0.1",
      'homepage_uri'      => 'https://github.com/evemonk/eve_online',
      'mailing_list_uri'  => "https://groups.example.com/bestgemever",
      'source_code_uri'   => "https://example.com/user/bestgemever"
  }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin)/}) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'mdl'

  spec.add_runtime_dependency 'activesupport', '>= 4.2.0'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'memoist'
end
