# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Incursion < Object
        def as_json
          {
            constellation_id: attributes.constellation_id,
            faction_id: attributes.faction_id,
            has_boss: attributes.has_boss,
            infested_solar_systems: attributes.infested_solar_systems,
            influence: attributes.influence,
            staging_solar_system_id: attributes.staging_solar_system_id,
            state: attributes.state,
            type: attributes.type
          }
        end
      end
    end
  end
end
