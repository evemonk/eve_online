require 'active_support/time'

module EveOnline
  module XML
    module Models
      class SkillQueueEntry
        attr_reader :options

        def initialize(options)
          @options = options
        end

        def as_json
          {
            queue_position: queue_position,
            type_id: type_id,
            level: level,
            start_sp: start_sp,
            end_sp: end_sp,
            start_time: start_time,
            end_time: end_time
          }
        end

        def queue_position
          options.fetch('@queuePosition').to_i
        end

        def type_id
          options.fetch('@typeID').to_i
        end

        def level
          options.fetch('@level').to_i
        end

        def start_sp
          options.fetch('@startSP').to_i
        end

        def end_sp
          options.fetch('@endSP').to_i
        end

        def start_time
          ActiveSupport::TimeZone['UTC'].parse(options.fetch('@startTime'))
        end

        def end_time
          ActiveSupport::TimeZone['UTC'].parse(options.fetch('@endTime'))
        end
      end
    end
  end
end
