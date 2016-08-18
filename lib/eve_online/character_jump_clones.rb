module EveOnline
  class CharacterJumpClones
    attr_reader :result

    def initialize(result)
      @result = result
    end

    def jump_clones
      output = []
      rowset.each do |jump_clone|
        output << JumpClone.new(jump_clone)
      end
      output
    end

    private

    def rowset
      @rowset ||= result.fetch('rowset').reject { |a| a.fetch('@name') != 'jumpClones' }.first.fetch('row')
    end
  end
end
