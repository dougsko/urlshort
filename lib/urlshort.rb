#!/usr/bin/env ruby
#
## URL Shortener
##
#
require 'rubygems'
require 'httpclient'

module UrlShort

    class IsGd
        def self.shorten(link)
            clnt = HTTPClient.new
            clnt.get('http://is.gd/api.php', {:longurl => link} ).content
        end
    end

    class TinyUrl
        def self.shorten(link)
            clnt = HTTPClient.new
            clnt.get('http://tinyurl.com/api-create.php', {:url => link} ).content
        end
    end


end
