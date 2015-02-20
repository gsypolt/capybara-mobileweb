# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobile/web/version'

Gem::Specification.new do |spec|
  spec.name          = "mobile-web"
  spec.version       = Mobile::Web::VERSION
  spec.authors       = ["Greg Sypolt"]
  spec.email         = ["gsypolt@gannett.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'cucumber',
  spec.add_development_dependency 'capybara',
  spec.add_development_dependency 'poltergeist', '~> 1.4.0'
  spec.add_development_dependency 'rspec-expectioins',
#   # spec.add_development_dependency "selenium",
#   # spec.add_development_dependency "selenium-webdriver", "~> 2.43.0"
#   # spec.add_development_dependency "launchy",
#   # spec.add_development_dependency "rest-client",
#   # spec.add_development_dependency "curb",
#   # spec.add_development_dependency "fivemat",
#   # spec.add_development_dependency "parallel_tests",
#   # spec.add_development_dependency "debugger-ruby_core_source",
#   # spec.add_development_dependency "pry",
#   # spec.add_development_dependency "pry-byebug"
# end
