# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Skill < Object
        def as_json
          {
            active_skill_level: attributes.active_skill_level,
            skill_id: attributes.skill_id,
            skillpoints_in_skill: attributes.skillpoints_in_skill,
            trained_skill_level: attributes.trained_skill_level
          }
        end
      end
    end
  end
end
