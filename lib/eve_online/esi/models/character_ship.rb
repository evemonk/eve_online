# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterShip < Base
        def as_json
          {
            ship_item_id: ship_item_id,
            ship_name: ship_name,
            ship_type_id: ship_type_id
          }
        end

        def ship_item_id
          options["ship_item_id"]
        end

        def ship_name
          options["ship_name"]
        end

        def ship_type_id
          options["ship_type_id"]
        end
      end
    end
  end
end
