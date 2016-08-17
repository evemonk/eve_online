require 'nori'
require 'active_support/time'

module EveOnline
  class BaseXML < Base
    attr_reader :parser

    def initialize
      @parser = Nori.new(advanced_typecasting: false)
    end

    def result
      @result ||= eveapi.fetch('result')
    end

    def cached_until
      @cached_until ||= ActiveSupport::TimeZone['UTC'].parse(eveapi.fetch('cachedUntil'))
    end

    def current_time
      @current_time ||= ActiveSupport::TimeZone['UTC'].parse(eveapi.fetch('currentTime'))
    end

    def version
      eveapi.fetch('@version').to_i
    end

    def eveapi
      @eveapi ||= response.fetch('eveapi')
    end

    private

    def parse_datetime_with_timezone(value)
      ActiveSupport::TimeZone['UTC'].parse(value)
    end
  end
end
