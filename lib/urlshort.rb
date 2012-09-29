#!/usr/bin/env ruby
#
## URL Shortener
##
#

require 'httpclient'

class BadRequest < RuntimeError
    def initialize(msg)
        puts "There was a problem with the original long URL provided."
        puts msg
    end
end

class NotAcceptable < RuntimeError
    def initialize(msg)
        puts "There was a problem with the short URL provided."
        puts msg
    end
end

class BadGateway < RuntimeError
    def initialize(msg)
        puts "Our rate limit was exceeded."
        puts msg
    end
end
    
class ServiceUnavailable < RuntimeError
    def initialize(msg)
        puts "This service is temporarily unavailable."
        puts msg
    end
end

class IsGd
    def self.shorten(link)
        err = 0
        clnt = HTTPClient.new
        resp = clnt.get('http://is.gd/create.php', 
                 {:format => 'simple', :url => link} )#.content
        begin
            case resp.status_code
            when 200
                return resp.content
            when 400
                raise BadRequest.new(resp.content)
            when 406
                raise NotAcceptable.new(resp.content)
            when 502
                raise BadGateway.new(resp.content)
            when 503
                raise ServiceUnavailable.new(resp.content)
            end
        rescue BadRequest
            err = 1
        rescue NotAcceptable
            err = 1
        rescue BadGateway
            err = 1
        rescue ServiceUnavailable
            err = 1
        end
        return err
    end
end

class VGd
    def self.shorten(link)
        err = 0
        clnt = HTTPClient.new
        resp = clnt.get('http://v.gd/create.php', 
                 {:format => 'simple', :url => link} )#.content
        begin
            case resp.status_code
            when 200
                return resp.content
            when 400
                raise BadRequest.new(resp.content)
            when 406
                raise NotAcceptable.new(resp.content)
            when 502
                raise BadGateway.new(resp.content)
            when 503
                raise ServiceUnavailable.new(resp.content)
            end
        rescue BadRequest
            err = 1
        rescue NotAcceptable
            err = 1
        rescue BadGateway
            err = 1
        rescue ServiceUnavailable
            err = 1
        end
        return err
    end
end
