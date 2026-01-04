# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class HomeLocation < Base
        def as_json
          {
            location_id: location_id,
            location_type: location_type
          }
        end

        def location_id
          options["location_id"]
        end

        def location_type
          options["location_type"]
        end
      end
    end
  end
end
