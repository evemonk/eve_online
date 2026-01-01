# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Faction < Base
        def as_json
          {
            corporation_id: corporation_id,
            description: description,
            faction_id: faction_id,
            is_unique: is_unique,
            militia_corporation_id: militia_corporation_id,
            name: name,
            size_factor: size_factor,
            solar_system_id: solar_system_id,
            station_count: station_count,
            station_system_count: station_system_count
          }
        end

        def corporation_id
          options["corporation_id"]
        end

        def description
          options["description"]
        end

        def faction_id
          options["faction_id"]
        end

        def is_unique
          options["is_unique"]
        end

        def militia_corporation_id
          options["militia_corporation_id"]
        end

        def name
          options["name"]
        end

        def size_factor
          options["size_factor"]
        end

        def solar_system_id
          options["solar_system_id"]
        end

        def station_count
          options["station_count"]
        end

        def station_system_count
          options["station_system_count"]
        end
      end
    end
  end
end
