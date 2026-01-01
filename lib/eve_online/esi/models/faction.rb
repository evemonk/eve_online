# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Faction < Object
        def as_json
          {
            corporation_id: attributes.corporation_id,
            description: attributes.description,
            faction_id: attributes.faction_id,
            is_unique: attributes.is_unique,
            militia_corporation_id: attributes.militia_corporation_id,
            name: attributes.name,
            size_factor: attributes.size_factor,
            solar_system_id: attributes.solar_system_id,
            station_count: attributes.station_count,
            station_system_count: attributes.station_system_count
          }
        end
      end
    end
  end
end
