require 'open-uri'
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

    memoize :user_agent

    def content
      open(url, open_timeout: 60, read_timeout: 60,
                'User-Agent' => user_agent).read
    end

    memoize :content

    def response
      parser.parse(content)
    end

    memoize :response
  end
end
