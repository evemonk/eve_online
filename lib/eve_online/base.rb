# frozen_string_literal: true

require 'faraday'
require 'memoist'

module EveOnline
  class Base
    extend Memoist

    def url
      raise NotImplementedError
    end

    def user_agent
      "EveOnline API (https://github.com/biow0lf/eve_online) v#{ VERSION }"
    end

    def content
      faraday = Faraday.new

      faraday.headers[:user_agent] = user_agent
      faraday.options.timeout = 60
      faraday.options.open_timeout = 60

      faraday.get(url).body
    rescue Faraday::TimeoutError
      raise EveOnline::Exceptions::TimeoutException
    end
    memoize :content

    def response
      parser.parse(content)
    end
    memoize :response
  end
end
