require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Urlshort" do
  it "tests is.gd" do
      Isgd.new.short('google.com').should match(/is.gd\/\w+/)
  end
end
