# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Station < Object
        def as_json
          {
            max_dockable_ship_volume: attributes.max_dockable_ship_volume,
            name: attributes.name,
            office_rental_cost: attributes.office_rental_cost,
            owner: attributes.owner,
            race_id: attributes.race_id,
            reprocessing_efficiency: attributes.reprocessing_efficiency,
            reprocessing_stations_take: attributes.reprocessing_stations_take,
            services: attributes.services,
            station_id: attributes.station_id,
            system_id: attributes.system_id,
            type_id: attributes.type_id
          }
        end

        def position
          @position ||= Position.new(attributes: attributes.position)
        end
      end
    end
  end
end
