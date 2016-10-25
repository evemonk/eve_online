require 'rest-client'
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
      client = RestClient::Request.execute(method: :get,
                                           url: url,
                                           open_timeout: 60,
                                           timeout: 60,
                                           headers: { user_agent: user_agent })

      client.body
    rescue RestClient::Timeout
      raise TimeoutException
    end
    memoize :content

    def response
      parser.parse(content)
    end
    memoize :response
  end
end
