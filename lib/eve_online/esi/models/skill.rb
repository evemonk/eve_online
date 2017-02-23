module EveOnline
  module ESI
    module Models
      class Skill
        attr_reader :options

        def initialize(options)
          @options = options
        end

        def as_json
          {
            skill_id: skill_id,
            skillpoints_in_skill: skillpoints_in_skill,
            current_skill_level: current_skill_level
          }
        end

        def skill_id
          options.fetch('skill_id')
        end

        def skillpoints_in_skill
          options.fetch('skillpoints_in_skill')
        end

        def current_skill_level
          options.fetch('current_skill_level')
        end
      end
    end
  end
end
