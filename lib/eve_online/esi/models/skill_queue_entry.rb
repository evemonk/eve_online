require 'active_support/time'

module EveOnline
  module ESI
    module Models
      class SkillQueueEntry < Base
        def as_json
          {
            skill_id: skill_id,
            finished_level: finished_level,
            queue_position: queue_position,
            finish_date: finish_date,
            start_date: start_date,
            training_start_sp: training_start_sp,
            level_end_sp: level_end_sp,
            level_start_sp: level_start_sp
          }
        end

        def skill_id
          options['skill_id']
        end

        def finished_level
          options['finished_level']
        end

        def queue_position
          options['queue_position']
        end

        def finish_date
          ActiveSupport::TimeZone['UTC'].parse(options['finish_date'])
        end

        def start_date
          ActiveSupport::TimeZone['UTC'].parse(options['start_date'])
        end

        def training_start_sp
          options['training_start_sp']
        end

        def level_end_sp
          options['level_end_sp']
        end

        def level_start_sp
          options['level_start_sp']
        end
      end
    end
  end
end
