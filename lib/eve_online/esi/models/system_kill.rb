# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SystemKill < Object
        def as_json
          {
            npc_kills: attributes.npc_kills,
            pod_kills: attributes.pod_kills,
            ship_kills: attributes.ship_kills,
            system_id: attributes.system_id
          }
        end
      end
    end
  end
end
