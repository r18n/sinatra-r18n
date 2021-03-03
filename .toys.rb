# frozen_string_literal: true

include :bundler, static: true

require 'gem_toys'
expand GemToys::Template,
  changelog_file_name: 'ChangeLog.md',
  version_file_path: 'lib/sinatra/r18n/version.rb',
  unreleased_title: '## Unreleased',
  version_tag_prefix: ''

alias_tool :g, :gem

tool :console do
  def run
    require_relative 'lib/sinatra/r18n'

    require 'pry'
    Pry.start
  end
end

alias_tool :c, :console
