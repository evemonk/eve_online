# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Faction < Base
        def as_json
          {
            faction_id: faction_id,
            name: name,
            description: description,
            solar_system_id: solar_system_id,
            corporation_id: corporation_id,
            militia_corporation_id: militia_corporation_id,
            size_factor: size_factor,
            station_count: station_count,
            station_system_count: station_system_count,
            is_unique: is_unique
          }
        end

        def faction_id
          options['faction_id']
        end

        def name
          options['name']
        end

        def description
          options['description']
        end

        def solar_system_id
          options['solar_system_id']
        end

        def corporation_id
          options['corporation_id']
        end

        def militia_corporation_id
          options['militia_corporation_id']
        end

        def size_factor
          options['size_factor']
        end

        def station_count
          options['station_count']
        end

        def station_system_count
          options['station_system_count']
        end

        def is_unique
          options['is_unique']
        end
      end
    end
  end
end
