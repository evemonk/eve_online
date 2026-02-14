# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterShip < Object
        def as_json
          {
            ship_item_id: attributes.ship_item_id,
            ship_name: attributes.ship_name,
            ship_type_id: attributes.ship_type_id
          }
        end
      end
    end
  end
end
