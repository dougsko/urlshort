#!/usr/bin/env ruby
#
## URL Shortener
##
#
require 'rubygems'
require 'httpclient'

class URLShort
end

class Isgd < URLShort
    def short(link)
        clnt = HTTPClient.new
        clnt.get('http://is.gd/api.php', {:longurl => link} ).content
    end
end
