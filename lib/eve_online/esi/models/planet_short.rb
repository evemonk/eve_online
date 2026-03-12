# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class PlanetShort < Object
        def as_json
          {
            planet_id: attributes.planet_id
          }
        end

        def asteroid_belt_ids
          attributes.asteroid_belts || []
        end

        def moon_ids
          attributes.moons || []
        end
      end
    end
  end
end
