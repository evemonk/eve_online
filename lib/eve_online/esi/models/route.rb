# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Route < Object
        def as_json
          {
            route: attributes.route
          }
        end
      end
    end
  end
end
