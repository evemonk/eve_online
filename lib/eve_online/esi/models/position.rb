# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Position < Object
        def as_json
          {
            x: attributes.x,
            y: attributes.y,
            z: attributes.z
          }
        end
      end
    end
  end
end
