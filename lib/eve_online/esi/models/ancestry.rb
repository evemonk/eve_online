# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Ancestry < Object
        def as_json
          {
            bloodline_id: attributes.bloodline_id,
            description: attributes.description,
            icon_id: attributes.icon_id,
            id: attributes.id,
            name: attributes.name,
            short_description: attributes.short_description
          }
        end
      end
    end
  end
end
