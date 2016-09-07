require 'memoist'

module EveOnline
  class CharacterJumpClones
    extend Memoist

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
    memoize :jump_clones

    private

    def rowset
      result.fetch('rowset').reject { |a| a.fetch('@name') != 'jumpClones' }.first.fetch('row')
    end
    memoize :rowset
  end
end
