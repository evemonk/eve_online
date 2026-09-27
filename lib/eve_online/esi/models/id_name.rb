# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class IdName < Object
        def as_json
          {
            id: attributes.id,
            name: attributes.name
          }
        end
      end
    end
  end
end
