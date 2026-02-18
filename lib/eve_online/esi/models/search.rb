# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Search < Object
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
            station_ids: station_ids,
            structure_ids: structure_ids
          }
        end

        def agent_ids
          attributes.agent || []
        end

        def alliance_ids
          attributes.alliance || []
        end

        def character_ids
          attributes.character || []
        end

        def constellation_ids
          attributes.constellation || []
        end

        def corporation_ids
          attributes.corporation || []
        end

        def faction_ids
          attributes.faction || []
        end

        def inventory_type_ids
          attributes.inventory_type || []
        end

        def region_ids
          attributes.region || []
        end

        def solar_system_ids
          attributes.solar_system || []
        end

        def station_ids
          attributes.station || []
        end

        def structure_ids
          attributes.structure || []
        end
      end
    end
  end
end
