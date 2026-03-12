# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Stargate < Object
        def as_json
          {
            name: attributes.name,
            stargate_id: attributes.stargate_id,
            system_id: attributes.system_id,
            type_id: attributes.type_id
          }
        end

        def position
          @position ||= Position.new(attributes: attributes.position)
        end

        def destination
          @destination ||= Destination.new(attributes: attributes.destination)
        end
      end
    end
  end
end
