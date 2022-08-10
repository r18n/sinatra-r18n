# frozen_string_literal: true

require_relative 'lib/sinatra/r18n/version'

Gem::Specification.new do |s|
  s.name     = 'sinatra-r18n'
  s.version  = Sinatra::R18n::VERSION

  s.summary     = 'A Sinatra extension that provides i18n support'
  s.description = <<-DESC
    A Sinatra extension that provides i18n support to translate your web
    application. It is just a wrapper for R18n core library.
    It has nice Ruby-style syntax, filters, flexible locales, custom loaders,
    translation support for any classes, time and number localization, several
    user language support, agnostic core package with out-of-box support for
    Rails, Sinatra and desktop applications.
  DESC

  s.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE', 'ChangeLog.md']
  s.extra_rdoc_files = ['README.md', 'LICENSE']

  s.authors  = ['Andrey Sitnik', 'Alexander Popov']
  s.email    = ['andrey@sitnik.ru', 'alex.wayfer@gmail.com']
  s.license  = 'LGPL-3.0'

  github_uri = "https://github.com/r18n/#{s.name}"

  s.homepage = github_uri

  s.metadata = {
    'bug_tracker_uri' => "#{github_uri}/issues",
    'changelog_uri' => "#{github_uri}/blob/#{s.version}/ChangeLog.md",
    'documentation_uri' => "http://www.rubydoc.info/gems/#{s.name}/#{s.version}",
    'homepage_uri' => s.homepage,
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => github_uri
  }

  s.required_ruby_version = '>= 2.6', '< 4'

  s.add_dependency 'r18n-core', '~> 5.0'
  s.add_dependency 'sinatra', '>= 1.3', '< 3'

  s.add_development_dependency 'pry-byebug', '~> 3.9'

  s.add_development_dependency 'gem_toys', '~> 0.12.1'
  s.add_development_dependency 'toys', '~> 0.13.0'

  s.add_development_dependency 'rubocop', '~> 1.34.1'
  s.add_development_dependency 'rubocop-performance', '~> 1.9'
  s.add_development_dependency 'rubocop-rake', '~> 0.6.0'

  s.add_development_dependency 'codecov', '~> 0.6.0'
  s.add_development_dependency 'rack-test', '~> 2.0'
  s.add_development_dependency 'rspec', '~> 3.10'
  s.add_development_dependency 'simplecov', '~> 0.21.0'
end
