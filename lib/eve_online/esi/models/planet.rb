# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Planet < Object
        def as_json
          {
            name: attributes.name,
            planet_id: attributes.planet_id,
            system_id: attributes.system_id,
            type_id: attributes.type_id
          }
        end

        def position
          @position ||= Position.new(attributes: attributes.position)
        end
      end
    end
  end
end
