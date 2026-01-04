# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaAttributeShort < Base
        def as_json
          {
            attribute_id: attribute_id,
            value: value
          }
        end

        def attribute_id
          options["attribute_id"]
        end

        def value
          options["value"]
        end
      end
    end
  end
end
