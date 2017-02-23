require 'active_support/time'

module EveOnline
  module ESI
    module Models
      class SkillQueueEntry
        attr_reader :options

        def initialize(options)
          @options = options
        end

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
          options.fetch('skill_id')
        end

        def finished_level
          options.fetch('finished_level')
        end

        def queue_position
          options.fetch('queue_position')
        end

        def finish_date
          ActiveSupport::TimeZone['UTC'].parse(options.fetch('finish_date'))
        end

        def start_date
          ActiveSupport::TimeZone['UTC'].parse(options.fetch('start_date'))
        end

        def training_start_sp
          options.fetch('training_start_sp')
        end

        def level_end_sp
          options.fetch('level_end_sp')
        end

        def level_start_sp
          options.fetch('level_start_sp')
        end
      end
    end
  end
end
