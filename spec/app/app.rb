# frozen_string_literal: true

require_relative '../../lib/sinatra/r18n'
require 'sinatra'

class TestApp < Sinatra::Base
  ## This have to be above `Sinatra::R18n` registration because there is R18n initialization
  ## See https://github.com/r18n/sinatra-r18n/issues/3
  before do
    session[:locale] = params[:lang] if params[:lang]
  end

  register Sinatra::R18n

  get '/:locale/posts/:name' do
    @post = params[:name]
    erb :post
  end

  get '/:locale/posts/:name/comments' do
    t.post.comments(3).to_s
  end

  get '/time' do
    l Time.at(0).utc
  end

  get '/locale' do
    r18n.locale.title
  end

  get '/locales' do
    r18n.available_locales.map { |i| "#{i.code}: #{i.title}" }.sort.join('; ')
  end

  get '/greater' do
    t.greater
  end

  get '/warning' do
    t.warning
  end

  get '/untranslated' do
    t.post.no.to_s
  end
end
