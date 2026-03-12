# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaAttribute < Object
        def as_json
          {
            attribute_id: attributes.attribute_id,
            default_value: attributes.default_value,
            description: attributes.description,
            display_name: attributes.display_name,
            high_is_good: attributes.high_is_good,
            icon_id: attributes.icon_id,
            name: attributes.name,
            published: attributes.published,
            stackable: attributes.stackable,
            unit_id: attributes.unit_id
          }
        end
      end
    end
  end
end
