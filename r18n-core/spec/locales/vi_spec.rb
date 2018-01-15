# frozen_string_literal: true

require File.expand_path('../../spec_helper', __FILE__)

describe R18n::Locales::Vi do
  it 'change times position' do
    th = R18n::I18n.new('vi')
    expect(th.l(Time.at(0).utc)).to eq('00:00, 01/01/1970')
  end
end
