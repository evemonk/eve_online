module EveOnline
  class CharacterImplants
    attr_reader :result

    def initialize(result)
      @result = result
    end

    private

    def rowset
      @rowset ||= result.fetch('rowset').reject { |a| a.fetch('@name') != 'implants' }.first.fetch('row')
    end
  end
end
