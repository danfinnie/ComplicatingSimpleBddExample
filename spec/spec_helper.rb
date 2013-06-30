require 'simple_bdd'
require 'rspec/autorun'
require_relative '../lib/method_missing_helper'

RSpec.configure do |config|
  config.include SimpleBdd
end
