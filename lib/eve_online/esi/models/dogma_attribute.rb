# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaAttribute < Object
        def as_json
          {
            attribute_id: attributes.attribute_id,
            value: attributes.value
          }
        end
      end
    end
  end
end
