require 'memoist'

module EveOnline
  class CharacterSkills
    extend Memoist

    attr_reader :result

    def initialize(result)
      @result = result
    end

    def skills
      output = []
      rowset.each do |skill|
        output << Skill.new(skill)
      end
      output
    end
    memoize :skills

    private

    def rowset
      result.fetch('rowset').reject { |a| a.fetch('@name') != 'skills' }.first.fetch('row')
    end
    memoize :rowset
  end
end
