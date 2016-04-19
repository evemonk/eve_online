require 'json'

module EveOnline
  class BaseCREST < Base
    attr_reader :parser

    def initialize
      @parser = JSON
    end
  end
end
