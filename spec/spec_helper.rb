ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end

def normalize(str)
  str.split("\n").map(&:strip).join("")
end

RSpec::Matchers.define :like_of do |expected|
  match do |actual|
    normalize(actual) == normalize(expected)
  end
end
