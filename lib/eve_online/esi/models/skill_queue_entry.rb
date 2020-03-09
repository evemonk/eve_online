# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SkillQueueEntry < Base
        def as_json
          {
            finish_date: finish_date,
            finished_level: finished_level,
            level_end_sp: level_end_sp,
            level_start_sp: level_start_sp,
            queue_position: queue_position,
            skill_id: skill_id,
            start_date: start_date,
            training_start_sp: training_start_sp
          }
        end

        def finish_date
          finish_date = options["finish_date"]

          parse_datetime_with_timezone(finish_date) if finish_date
        end

        def finished_level
          options["finished_level"]
        end

        def level_end_sp
          options["level_end_sp"]
        end

        def level_start_sp
          options["level_start_sp"]
        end

        def queue_position
          options["queue_position"]
        end

        def skill_id
          options["skill_id"]
        end

        def start_date
          start_date = options["start_date"]

          parse_datetime_with_timezone(start_date) if start_date
        end

        def training_start_sp
          options["training_start_sp"]
        end
      end
    end
  end
end
