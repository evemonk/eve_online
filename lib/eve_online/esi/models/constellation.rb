# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Constellation < Object
        def as_json
          {
            constellation_id: attributes.constellation_id,
            name: attributes.name,
            region_id: attributes.region_id
          }
        end

        def position
          @position ||= Position.new(attributes: attributes.position)
        end

        def system_ids
          attributes.systems || []
        end
      end
    end
  end
end
