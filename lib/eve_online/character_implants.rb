require 'memoist'

module EveOnline
  class CharacterImplants
    extend Memoist

    attr_reader :result

    def initialize(result)
      @result = result
    end

    def implants
      output = []
      rowset.each do |implant|
        output << Implant.new(implant)
      end
      output
    end
    memoize :implants

    private

    def rowset
      result.fetch('rowset').reject { |a| a.fetch('@name') != 'implants' }.first.fetch('row')
    end
    memoize :rowset
  end
end
