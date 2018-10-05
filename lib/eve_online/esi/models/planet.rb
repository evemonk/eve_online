# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Planet < Base
        def as_json
          {
            planet_id: planet_id
          }
        end

        def planet_id
          options['planet_id']
        end

        def asteroid_belt_ids
          options['asteroid_belts']
        end

        def moon_ids
          options['moons']
        end
      end
    end
  end
end
