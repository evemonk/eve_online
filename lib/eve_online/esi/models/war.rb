# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class War < Base
        def as_json
          {
            declared: declared,
            finished: finished,
            war_id: war_id,
            mutual: mutual,
            open_for_allies: open_for_allies,
            retracted: retracted,
            started: started
          }
        end

        def declared
          declared = options["declared"]

          parse_datetime_with_timezone(declared) if declared
        end

        def finished
          finished = options["finished"]

          parse_datetime_with_timezone(finished) if finished
        end

        def war_id
          options["id"]
        end

        def mutual
          options["mutual"]
        end

        def open_for_allies
          options["open_for_allies"]
        end

        def retracted
          retracted = options["retracted"]

          parse_datetime_with_timezone(retracted) if retracted
        end

        def started
          started = options["started"]

          parse_datetime_with_timezone(started) if started
        end

        def aggressor
          @aggressor ||= Aggressor.new(options["aggressor"])
        end

        def allies
          @allies ||= Allies.new(options["allies"]).allies
        end

        def defender
          @defender ||= Defender.new(options["defender"])
        end
      end
    end
  end
end
