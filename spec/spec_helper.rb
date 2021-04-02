# frozen_string_literal: true

require 'pp'
require 'pry-byebug'

require 'simplecov'
SimpleCov.start

if ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
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

RSpec.configure { |c| c.include RSpecMixinExample }

set :environment, :test
set :root, File.join(File.dirname(__FILE__), 'app')
