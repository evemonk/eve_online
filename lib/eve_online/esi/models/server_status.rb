# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class ServerStatus < Object
        def as_json
          {
            players: attributes.players,
            server_version: attributes.server_version,
            start_time: attributes.start_time,
            vip: attributes.vip
          }
        end
      end
    end
  end
end
