# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class ServerStatus < Base
        def as_json
          {
            players: players,
            server_version: server_version,
            start_time: start_time,
            vip: vip
          }
        end

        def players
          options["players"]
        end

        def server_version
          options["server_version"]
        end

        def start_time
          start_time = options["start_time"]

          parse_datetime_with_timezone(start_time) if start_time
        end

        def vip
          options["vip"]
        end
      end
    end
  end
end
