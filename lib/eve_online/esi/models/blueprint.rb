# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Blueprint < Base
        def as_json
          {
            item_id: item_id,
            location_flag: location_flag,
            location_id: location_id,
            material_efficiency: material_efficiency,
            quantity: quantity,
            runs: runs,
            time_efficiency: time_efficiency,
            type_id: type_id
          }
        end

        def item_id
          options["item_id"]
        end

        def location_flag
          options["location_flag"]
        end

        def location_id
          options["location_id"]
        end

        def material_efficiency
          options["material_efficiency"]
        end

        def quantity
          options["quantity"]
        end

        def runs
          options["runs"]
        end

        def time_efficiency
          options["time_efficiency"]
        end

        def type_id
          options["type_id"]
        end
      end
    end
  end
end
