# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class HomeLocation < Object
        def as_json
          {
            location_id: attributes.location_id,
            location_type: attributes.location_type
          }
        end
      end
    end
  end
end
