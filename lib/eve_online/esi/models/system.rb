# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class System < Object
        def as_json
          {
            constellation_id: attributes.constellation_id,
            name: attributes.name,
            security_class: attributes.security_class,
            security_status: attributes.security_status,
            star_id: attributes.star_id,
            system_id: attributes.system_id
          }
        end

        def planets
        end

        def position
          @position ||= Position.new(attributes: attributes.position)
        end

        def stargates
        end

        def stations
        end
      end
    end
  end
end
