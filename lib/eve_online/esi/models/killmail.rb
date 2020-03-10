# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Killmail < Base
        def as_json
          {
            killmail_id: killmail_id,
            killmail_time: killmail_time,
            moon_id: moon_id,
            solar_system_id: solar_system_id,
            war_id: war_id
          }
        end

        def killmail_id
          options["killmail_id"]
        end

        def killmail_time
          killmail_time = options["killmail_time"]

          parse_datetime_with_timezone(killmail_time) if killmail_time
        end

        def moon_id
          options["moon_id"]
        end

        def solar_system_id
          options["solar_system_id"]
        end

        def war_id
          options["war_id"]
        end

        # def attackers
        # end
        #
        # def victim
        # end
      end
    end
  end
end
