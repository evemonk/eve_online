# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SkillQueueEntry < Object
        def as_json
          {
            finish_date: attributes.finish_date,
            finished_level: attributes.finished_level,
            level_end_sp: attributes.level_end_sp,
            level_start_sp: attributes.level_start_sp,
            queue_position: attributes.queue_position,
            skill_id: attributes.skill_id,
            start_date: attributes.start_date,
            training_start_sp: attributes.training_start_sp
          }
        end
      end
    end
  end
end
