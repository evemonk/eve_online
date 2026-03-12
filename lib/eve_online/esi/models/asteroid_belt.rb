# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AsteroidBelt < Object
        def as_json
          {
            name: attributes.name,
            system_id: attributes.system_id
          }
        end

        def position
          @position ||= Position.new(attributes: attributes.position)
        end
      end
    end
  end
end
