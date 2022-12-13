# frozen_string_literal: true

appraise "activesupport_52" do
  gem "activesupport", "~> 5.2.0"
end

appraise "activesupport_60" do
  gem "activesupport", "~> 6.0.0"
end

appraise "activesupport_61" do
  gem "activesupport", "~> 6.1.0"
end

if Gem::Version.new(RUBY_VERSION) > Gem::Version.new("3.0.0")
  appraise "activesupport_70" do
    gem "activesupport", "~> 7.0.0"
  end
end

if Gem::Version.new(RUBY_VERSION) > Gem::Version.new("2.7.0")
  appraise "activesupport_edge" do
    gem "activesupport", git: "https://github.com/rails/rails", require: "activesupport", branch: "main"
  end
end
