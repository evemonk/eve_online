# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class UniverseName < Object
        def as_json
          {
            category: attributes.category,
            id: attributes.id,
            name: attributes.name
          }
        end
      end
    end
  end
end
