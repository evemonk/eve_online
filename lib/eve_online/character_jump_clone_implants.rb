require 'memoist'

module EveOnline
  class CharacterJumpCloneImplants
    extend Memoist

    attr_reader :result

    def initialize(result)
      @result = result
    end

    def jump_clone_implants
      output = []
      rowset.each do |jump_clone_implant|
        output << JumpCloneImplant.new(jump_clone_implant)
      end
      output
    end
    memoize :jump_clone_implants

    private

    def rowset
      result.fetch('rowset').reject { |a| a.fetch('@name') != 'jumpCloneImplants' }.first.fetch('row')
    end
    memoize :rowset
  end
end
