require File.dirname(__FILE__) + "/lib/huh"
Gem::Specification.new do |s|
  s.name        = "huh"
  s.version     = Huh::V
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Justin Baker"]
  s.email       = ["bakermoto@gmail.com"]
  s.homepage    = "http://github.com/justinbaker/huh"
  s.summary     = "40 line ruby unit testing library"
  s.description = "A tiny(<40 lines) library for unit testing"
  s.required_rubygems_version = ">= 1.3.6"
  # lol - required for validation
  s.rubyforge_project         = "huh"
  s.files        = Dir["{lib,examples}/**/*.rb", "LICENSE", "*.md"]
  s.require_path = 'lib'
end
