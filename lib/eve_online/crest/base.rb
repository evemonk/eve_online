require 'json'

module EveOnline
  module CREST
    class Base
      attr_reader :parser

      def initialize
        @parser = JSON
      end

      def url
        raise NotImplementedError
      end

      def user_agent
        @user_agent ||= "EveOnline API (https://github.com/biow0lf/eve_online) v#{ EveOnline::VERSION }"
      end

      def content
        @content ||= open(url, open_timeout: 60, read_timeout: 60,
                          'User-Agent' => user_agent).read
      end

      def response
        @response ||= parser.parse(content)
      end
    end
  end
end
