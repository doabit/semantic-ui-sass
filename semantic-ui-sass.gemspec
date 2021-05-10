# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'semantic/ui/sass/version'

Gem::Specification.new do |spec|
  spec.name          = "semantic-ui-sass"
  spec.version       = Semantic::Ui::Sass::VERSION
  spec.authors       = ["doabit"]
  spec.email         = ["doinsist@gmail.com"]
  spec.description   = %q{Semantic UI, converted to Sass and ready to drop into Rails, Compass, or Sprockets.}
  spec.summary       = %q{Semantic UI, converted to Sass and ready to drop into Rails, Compass, or Sprockets.}
  spec.homepage      = "http://github.com/doabit/semantic-ui-sass"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency     'sassc'
  spec.add_development_dependency 'sassc-rails'
  spec.add_development_dependency 'sprockets-rails', '>= 2.1.3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'rspec-rails', '>= 3.0'
  spec.add_development_dependency "rails", '>= 3.2.0'
  spec.add_development_dependency "autoprefixer-rails"
end
