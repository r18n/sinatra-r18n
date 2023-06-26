# frozen_string_literal: true

require 'pry-byebug'

require 'simplecov'

if ENV['CI']
  require 'simplecov-cobertura'
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
end

SimpleCov.start

RSpec.configure do |config|
  config.example_status_persistence_file_path = "#{__dir__}/examples.txt"
end

ENV['RACK_ENV'] = 'test'
require_relative 'app/app'

require 'rack/test'

module RSpecMixinExample
  include Rack::Test::Methods

  def app
    TestApp
  end
end

RSpec.configure do |c|
  c.include RSpecMixinExample
  c.disable_monkey_patching!
end

set :environment, :test
set :root, File.join(File.dirname(__FILE__), 'app')
