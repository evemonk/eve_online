module EveOnline
  class CharacterImplants
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

    private

    def rowset
      result.fetch('rowset').reject { |a| a.fetch('@name') != 'implants' }.first.fetch('row')
    end
  end
end
