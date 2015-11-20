require 'open-uri'
require 'nori'

module EveOnline
  class Base
    attr_reader :key_id, :v_code, :parser

    def initialize(key_id = nil, v_code = nil, parser = Nori.new)
      @key_id = key_id
      @v_code = v_code
      @parser = parser
    end

    def url
      raise NotImplementedError
    end

    def content
      open(url, open_timeout: 60, read_timeout: 60).read
    end

    def response
      @response ||= parser.parse(content)
    end
  end
end
