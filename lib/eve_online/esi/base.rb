require 'memoist'
require 'active_support/time'

module EveOnline
  module ESI
    class Base
      extend Memoist

      attr_reader :token, :parser

      def initialize(token = nil)
        @token = token
        @parser = JSON
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

      # TODO: extract to class
      def content
        faraday = Faraday.new

        faraday.headers[:user_agent] = user_agent
        faraday.authorization(:Bearer, token) if token
        faraday.options.timeout = 60
        faraday.options.open_timeout = 60

        # raise EveOnline::Exceptions::InvalidSSOTokenException if res.status == 403

        # case res.status
        # when 200
        #   res.body
        # when 403
        #   # raise EveOnline::ESI::ForbiddenError
        # when 404
        #   # raise EveOnline::ESI::NotFoundError
        # else
        #   # raise EveOnline::ESI::UnsupportedResponseStatus
        # end

        # res.body
        # faraday.get(url).body

        res = faraday.get(url)

        case res.status
        when 200
          res.body
        when 403
          raise EveOnline::Exceptions::InvalidSSOTokenException, parser.parse(res.body).fetch('error')
        end
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
