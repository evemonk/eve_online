# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SystemKill < Base
        def as_json
          {
            npc_kills: npc_kills,
            pod_kills: pod_kills,
            ship_kills: ship_kills,
            system_id: system_id
          }
        end

        def npc_kills
          options["npc_kills"]
        end

        def pod_kills
          options["pod_kills"]
        end

        def ship_kills
          options["ship_kills"]
        end

        def system_id
          options["system_id"]
        end
      end
    end
  end
end
