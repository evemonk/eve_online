# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Station < Base
        def as_json
          {
            max_dockable_ship_volume: max_dockable_ship_volume,
            name: name,
            office_rental_cost: office_rental_cost,
            owner: owner,
            race_id: race_id,
            reprocessing_efficiency: reprocessing_efficiency,
            reprocessing_stations_take: reprocessing_stations_take,
            services: services,
            station_id: station_id,
            system_id: system_id,
            type_id: type_id
          }
        end

        def max_dockable_ship_volume
          options["max_dockable_ship_volume"]
        end

        def name
          options["name"]
        end

        def office_rental_cost
          options["office_rental_cost"]
        end

        def owner
          options["owner"]
        end

        def race_id
          options["race_id"]
        end

        def reprocessing_efficiency
          options["reprocessing_efficiency"]
        end

        def reprocessing_stations_take
          options["reprocessing_stations_take"]
        end

        def services
          options["services"]
        end

        def station_id
          options["station_id"]
        end

        def system_id
          options["system_id"]
        end

        def type_id
          options["type_id"]
        end

        def position
          @position ||= Position.new(options["position"])
        end
      end
    end
  end
end
