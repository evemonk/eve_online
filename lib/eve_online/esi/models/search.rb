# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Search < Base
        def as_json
          {
            agent_ids: agent_ids,
            alliance_ids: alliance_ids,
            character_ids: character_ids,
            constellation_ids: constellation_ids,
            corporation_ids: corporation_ids,
            faction_ids: faction_ids,
            inventory_type_ids: inventory_type_ids,
            region_ids: region_ids,
            solar_system_ids: solar_system_ids,
            station_ids: station_ids
          }
        end

        def agent_ids
          options.fetch("agent", [])
        end

        def alliance_ids
          options.fetch("alliance", [])
        end

        def character_ids
          options.fetch("character", [])
        end

        def constellation_ids
          options.fetch("constellation", [])
        end

        def corporation_ids
          options.fetch("corporation", [])
        end

        def faction_ids
          options.fetch("faction", [])
        end

        def inventory_type_ids
          options.fetch("inventory_type", [])
        end

        def region_ids
          options.fetch("region", [])
        end

        def solar_system_ids
          options.fetch("solar_system", [])
        end

        def station_ids
          options.fetch("stations", [])
        end
      end
    end
  end
end
