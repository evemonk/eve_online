module EveOnline
  class CharacterSkills
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

    private

    def rowset
      @rowset ||= result.fetch('rowset').reject { |a| a.fetch('@name') != 'skills' }.first.fetch('row')
    end
  end
end
