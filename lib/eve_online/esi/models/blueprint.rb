# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Blueprint < Object
        def as_json
          {
            item_id: attributes.item_id,
            location_flag: attributes.location_flag,
            location_id: attributes.location_id,
            material_efficiency: attributes.material_efficiency,
            quantity: attributes.quantity,
            runs: attributes.runs,
            time_efficiency: attributes.time_efficiency,
            type_id: attributes.type_id
          }
        end
      end
    end
  end
end
