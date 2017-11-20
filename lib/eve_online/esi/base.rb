require 'json'
require 'memoist'
require 'active_support/time'

module EveOnline
  module ESI
    class Base
      extend Memoist

      attr_reader :token, :parser

      def initialize(options = {})
        @token = options[:token]
        @parser = JSON
        options.each do |k,v|
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def url
        raise NotImplementedError
      end

      def scope
        raise NotImplementedError
      end

      def user_agent
        "EveOnline API (https://github.com/biow0lf/eve_online) v#{ VERSION }"
      end

      def content
        faraday = Faraday.new

        faraday.headers[:user_agent] = user_agent
        faraday.authorization(:Bearer, token) if token
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

      private

      def parse_datetime_with_timezone(value)
        ActiveSupport::TimeZone['UTC'].parse(value)
      end
    end
  end
end
