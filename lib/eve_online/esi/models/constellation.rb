# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Constellation < Base
        def as_json
          {
            constellation_id: constellation_id,
            name: name,
            position_x: position_x,
            position_y: position_y,
            position_z: position_z,
            region_id: region_id,
            systems: systems
          }
        end

        def constellation_id
          options['constellation_id']
        end

        def name
          options['name']
        end

        def position_x
          options['position']['x'] if options['position']
        end

        def position_y
          options['position']['y'] if options['position']
        end

        def position_z
          options['position']['z'] if options['position']
        end

        def region_id
          options['region_id']
        end

        def systems
          options['systems']
        end
      end
    end
  end
end
