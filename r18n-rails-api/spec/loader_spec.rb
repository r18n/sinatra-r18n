# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe R18n::Loader::Rails do
  before do
    I18n.load_path = [SIMPLE]
    @loader = R18n::Loader::Rails.new
  end

  it "should return available locales" do
    @loader.available.should =~ [EN, RU]
  end

  it "should load translation" do
    @loader.load(RU).should == { 'one' => 'Один', 'two' => 'Два' }
  end

  it "should change pluralization" do
    @loader.load(EN).should == {
      'users' => R18n::Typed.new('pl', {
        0 => 'Zero', 1 => 'One', 2 => 'Few', 'n' => 'Other'
       })
    }
  end

  it "should change Russian pluralization" do
    I18n.load_path = [PL]
    @loader.load(RU).should == {
      'users' => R18n::Typed.new('pl', {
        0 => 'Ноль', 1 => 'Один', 2 => 'Несколько', 'n' => 'Много'
       })
    }
  end

  it "should reload translations on load_path changes" do
    I18n.load_path << OTHER
    @loader.load(RU).should == { 'one' => 'Один', 'two' => 'Два',
                                 'three' => 'Три' }
  end

  it "should change hash on load_path changes" do
    before = @loader.hash
    I18n.load_path << OTHER
    @loader.hash.should_not == before
  end

end
