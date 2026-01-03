# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterAsset < Object
        def as_json
          {
            is_blueprint_copy: attributes.is_blueprint_copy,
            is_singleton: attributes.is_singleton,
            item_id: attributes.item_id,
            location_flag: attributes.location_flag,
            location_id: attributes.location_id,
            location_type: attributes.location_type,
            quantity: attributes.quantity,
            type_id: attributes.type_id
          }
        end
      end
    end
  end
end
