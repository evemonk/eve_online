# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class PlanetShort < Base
        def as_json
          {
            planet_id: planet_id
          }
        end

        def planet_id
          options["planet_id"]
        end

        def asteroid_belt_ids
          options.fetch("asteroid_belts", [])
        end

        def moon_ids
          options.fetch("moons", [])
        end
      end
    end
  end
end
