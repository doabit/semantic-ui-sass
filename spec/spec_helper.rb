ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|
end

def normalize(str)
  str.split("\n").map(&:strip).join("")
end

RSpec::Matchers.define :like_of do |expected|
  match do |actual|
    normalize(actual) == normalize(expected)
  end
end