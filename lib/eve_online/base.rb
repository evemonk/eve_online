require 'open-uri'
require 'nori'
require 'active_support/time'

module EveOnline
  class Base
    attr_reader :key_id, :v_code, :parser

    def initialize(key_id = nil, v_code = nil, parser = Nori.new)
      @key_id = key_id
      @v_code = v_code
      @parser = parser
    end

    def result
      @result ||= eveapi.fetch('result')
    end

    def cached_until
      @cached_until ||= begin
        Time.zone = 'UTC'
        Time.zone.parse(eveapi.fetch('cachedUntil'))
      end
    end

    def current_time
      @current_time ||= begin
        Time.zone = 'UTC'
        Time.zone.parse(eveapi.fetch('currentTime'))
      end
    end

    def version
      # TODO: check all API for version
      raise NotImplementedError
    end

    def eveapi
      @eveapi ||= response.fetch('eveapi')
    end

    def url
      raise NotImplementedError
    end

    def content
      @content ||= open(url, open_timeout: 60, read_timeout: 60).read
    end

    def response
      @response ||= parser.parse(content)
    end
  end
end
