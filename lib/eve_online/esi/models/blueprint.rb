# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Blueprint < Base
        def as_json
          {
            item_id: item_id,
            type_id: type_id,
            location_id: location_id,
            quantity: quantity,
            time_efficiency: time_efficiency,
            material_efficiency: material_efficiency,
            runs: runs,
            location_flag: location_flag
          }
        end

        def item_id
          options['item_id']
        end

        def type_id
          options['type_id']
        end

        def location_id
          options['location_id']
        end

        def quantity
          options['quantity']
        end

        def time_efficiency
          options['time_efficiency']
        end

        def material_efficiency
          options['material_efficiency']
        end

        def runs
          options['runs']
        end

        def location_flag
          options['location_flag']
        end
      end
    end
  end
end
