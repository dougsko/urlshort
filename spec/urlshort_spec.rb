require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "UrlShort" do
    it "tests is.gd" do
        UrlShort::IsGd.shorten('google.com').should match "http://is.gd/\w+"
    end

    it "tests TinyUrl" do
        UrlShort::TinyUrl.shorten('google.com').should match "http://tinyurl.com/\w+"
    end

end
