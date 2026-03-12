# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Region < Object
        def as_json
          {
            description: attributes.description,
            name: attributes.name,
            region_id: attributes.region_id
          }
        end
      end
    end
  end
end
