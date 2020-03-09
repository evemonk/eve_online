# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Skill < Base
        def as_json
          {
            active_skill_level: active_skill_level,
            skill_id: skill_id,
            skillpoints_in_skill: skillpoints_in_skill,
            trained_skill_level: trained_skill_level
          }
        end

        def active_skill_level
          options["active_skill_level"]
        end

        def skill_id
          options["skill_id"]
        end

        def skillpoints_in_skill
          options["skillpoints_in_skill"]
        end

        def trained_skill_level
          options["trained_skill_level"]
        end
      end
    end
  end
end
