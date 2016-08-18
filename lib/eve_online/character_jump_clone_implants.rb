module EveOnline
  class CharacterJumpCloneImplants
    attr_reader :result

    def initialize(result)
      @result = result
    end

    # def jump_clone_implants
    #
    # end

    private

    def rowset
      @rowset ||= result.fetch('rowset').reject { |a| a.fetch('@name') != 'jumpCloneImplants' }.first.fetch('row')
    end
  end
end
